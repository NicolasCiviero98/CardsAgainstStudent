import 'post_model.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'globals.dart' as globals;
import 'http_service.dart';
import 'widgets/player_item.dart';
import 'dart:io';

class MatchListPage extends StatefulWidget {
  const MatchListPage({Key? key}) : super(key: key);

  @override
  State<MatchListPage> createState() => _MatchListPageState();
}

class _MatchListPageState extends State<MatchListPage> {
  List<String> rooms = [];
  var username = '';

  final fieldText = TextEditingController();

  @override
  void initState() {
    super.initState();
    globals.socket ??= IO.io('http://10.0.2.2:3000',
          IO.OptionBuilder().setTransports(['websocket']).build()
      );

    globals.socket!.on("connect", (_) { print('Connected'); });

    globals.socket!.on("roomList", (roomsString) {
      setState( () { rooms = roomsString.split(';');});
    });

    globals.socket!.on("joinSuccess", (data) {
      Navigator.pushNamed( context, '/new_match',
        arguments: {'players': data['players'], 'room': data['room']},
      );
    });

    globals.socket!.on("roomUsers", (data) {
      List users = data['users'].toList();
      List<String> players = [];
      users.forEach((var user) => players.add(user['username']));

      Navigator.pushNamed( context, '/new_match',
        arguments: {'players': players, 'room': users[0]['room']},
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    if (rooms.isEmpty) { globals.socket!.emit('getRooms'); }

    return Material(
        child:SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(' Salas:', style: TextStyle(fontSize: 40)),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 48,
                            width: MediaQuery.of(context).size.width,
                            color: Color.fromARGB(255, 230, 230, 230),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                              child: buildRoomsList()
                            ),
                          )
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                        children: [
                          const Expanded(flex: 25, child: SizedBox()),
                          Expanded(
                            flex: 50,
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context,true);
                                  //Navigator.of(context).pushNamed('/menu');
                                },
                                child: Text('Voltar', style: TextStyle(fontSize: 20)),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.grey,
                                  onPrimary: Colors.black,
                                  elevation: 5,
                                  shadowColor: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(flex: 25, child: SizedBox()),
                        ]
                    ),
                  ],
                )

            )
        )
    );
  }

  Widget buildRoomsList() => rooms.isEmpty ?
    Center(child: CircularProgressIndicator()) :
    ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final name = rooms[index];
          return Card(
            child: GestureDetector(
                onTap: () {
                  globals.socket!.emit('joinRoom', {'username': globals.username, 'room': name});
                  //Navigator.pushNamed( context, '/new_match', arguments: {'username': username} );
                },
                child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12,0,6,0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(name, style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                  ),
                )
            ),
          );
        });
}

