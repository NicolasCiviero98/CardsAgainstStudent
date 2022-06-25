import 'package:flutter/material.dart';

import 'globals.dart' as globals;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class NewMatchPage extends StatefulWidget {
  const NewMatchPage({Key? key}) : super(key: key);

  @override
  State<NewMatchPage> createState() => _NewMatchPageState();
}

class _NewMatchPageState extends State<NewMatchPage> {
  List<String> players = [];
  String currentRoom = '';
  final fieldText = TextEditingController();

  @override
  void initState() {
    super.initState();
    globals.socket ??= IO.io('http://10.0.2.2:3000',
        IO.OptionBuilder().setTransports(['websocket']).build()
    );

    globals.socket!.on("roomUsers", (data) {
      List users = data['users'].toList();
      players.clear();
      users.forEach((var user) => players.add(user['username']));
    });

    globals.socket!.on("roundUpdate", (data) {
      Navigator.pushNamed( context, '/match', arguments: data);
    });

  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    players = arguments['players'];
    currentRoom = arguments['room'];

    return Material(
        child:SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: Text(currentRoom, style: TextStyle(fontSize: 40)),
                ),
                const SizedBox(height: 8),
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                        height: 48,
                        width: double.infinity,
                        color: Color.fromARGB(255, 230, 230, 230),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                          child: buildPlayersList(),
                        ),
                    )
                  ),
                ),
                SizedBox(height: 8),
                Row(
                    children: [
                      Expanded(
                        flex: 50,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              globals.socket!.emit('leaveRoom');
                              Navigator.of(context).pushNamed('/menu');
                            },
                            child: Text('Sair', style: TextStyle(fontSize: 20)),
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
                      Expanded(
                        flex: 50,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              //Navigator.of(context).pushNamed('/student_match');
                              globals.socket!.emit('roomStart');
                            },
                            child: Text('Iniciar', style: TextStyle(fontSize: 20)),
                            style: globals.btnStyle1,
                          ),
                        ),
                      ),
                    ]
                ),
              ],
            )

          )
        )
    );
  }

  Widget buildPlayersList() =>
  ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final name = players[index];
        return Container(
          height: 52,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 12),
                Text(name, style: TextStyle(fontSize: 20)),
                Expanded(flex: 1, child: SizedBox(),)
              ],
            ),
          ),
        );
      });
}

