import 'post_model.dart';
import 'package:flutter/material.dart';

import 'globals.dart' as globals;
import 'http_service.dart';
import 'widgets/player_item.dart';

class MatchListPage extends StatefulWidget {
  const MatchListPage({Key? key}) : super(key: key);

  @override
  State<MatchListPage> createState() => _MatchListPageState();
}

class _MatchListPageState extends State<MatchListPage> {
  String addUsername = '';
  List<String> rooms = ['Sala 1', 'Sala 2', 'Sala 3', 'Sala 4', 'Sala 5', 'Sala 6', 'Sala 7'];
  final fieldText = TextEditingController();

  void clearUsername() {
    fieldText.clear();
    addUsername = '';
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    var username = arguments['username'];

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
                              child: ListView(
                                children: rooms.map((name) =>
                                    Card(
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              '/new_match',
                                              arguments: {'username': username},
                                            );
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
                                    )).toList(),
                              )
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
                                  Navigator.of(context).pushNamed('/menu');
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
}

