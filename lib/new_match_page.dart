import 'post_model.dart';
import 'package:flutter/material.dart';

import 'globals.dart' as globals;
import 'http_service.dart';
import 'widgets/player_item.dart';

class NewMatchPage extends StatefulWidget {
  const NewMatchPage({Key? key}) : super(key: key);

  @override
  State<NewMatchPage> createState() => _NewMatchPageState();
}

class _NewMatchPageState extends State<NewMatchPage> {
  String addUsername = '';
  List<Widget> players = [];
  final fieldText = TextEditingController();

  void clearUsername() {
    fieldText.clear();
    addUsername = '';
  }

  void addUserToListView1() {
    setState(() {
      int index = players.length;
      players.add(
        Container(
          height: 52,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4,0,4,0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                      height: 48,
                      width: double.infinity,
                      color: Color.fromARGB(255, 230, 230, 230),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(addUsername, style: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(
                              width: 30,
                              child: TextButton(
                                  onPressed: () { setState(() {
                                    players.removeAt(index);
                                  });},
                                  child: Text("X", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                              ),
                            ),
                          ],
                        )
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      clearUsername();
    });
  }

  void addUserToListView2() {
    setState(() {
      int index = players.length;
      players.add(
        Container(
          height: 52,
          child: Card(
            child: Padding(
              padding: EdgeInsets.fromLTRB(12,0,6,0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(addUsername, style: TextStyle(fontSize: 20)),
                  ),
                  SizedBox(
                    width: 30,
                    child: TextButton(
                      onPressed: () { setState(() {
                        players.removeAt(index);
                      });},
                      child: Text("X", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, decoration: TextDecoration.none, color: Colors.black, fontFamily: "Arial"),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      clearUsername();
    });
  }

  void addUserToListView() {
    if (addUsername == '') return;

    setState(() {

      HttpService.getPosts();

      players.add(
        PlayerItem(
            username: addUsername,
            delete: () {
              setState(() { players.remove(this); });
            }
        )
      );
      clearUsername();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child:SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            onChanged: (text) { addUsername = text; },
                            decoration: InputDecoration( border: OutlineInputBorder()),
                            style: TextStyle(fontSize: 20),
                            controller: fieldText,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            addUserToListView();
                          },
                          child: Text('+', style: TextStyle(fontSize: 40)),
                        ),
                      ),
                    ]
                ),
                SizedBox(height: 8),
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
                            child: ListView.builder(
                              itemCount: players.length,
                              itemBuilder: (context,index) {
                                return players[index];
                              },
                            ),
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
                              Navigator.of(context).pushNamed('/menu');
                            },
                            child: Text('Cancelar', style: TextStyle(fontSize: 20)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              onPrimary: Colors.black,
                              elevation: 5,
                              shadowColor: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 50,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/student_match');
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
}

