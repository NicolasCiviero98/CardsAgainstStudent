import 'package:flutter/material.dart';


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
                SizedBox(height: 30),
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
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              players.add(
                                Container(
                                  height: 44,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(4,0,4,0),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Container(
                                              height: 40,
                                              width: double.infinity,
                                              color: Color.fromARGB(255, 230, 230, 230),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Text(addUsername, style: TextStyle(fontSize: 20)),
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
                          },
                          child: Text('+', style: TextStyle(fontSize: 40)),
                        ),
                      ),
                    ]
                ),
                SizedBox(height: 16),
                Expanded(
                  flex: 1,
                  child: DecoratedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ListView.builder(
                          itemCount: players.length,
                          itemBuilder: (context,index) {
                            return players[index];
                          }),
                    ),
                    decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2.5, style: BorderStyle.solid))
                  ),
                ),
                SizedBox(height: 16),
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
                              primary: Colors.red,
                              onPrimary: Colors.black,
                              elevation: 5,
                              shadowColor: Colors.amber,
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
                              Navigator.of(context).pushNamed('/match');
                            },
                            child: Text('Iniciar', style: TextStyle(fontSize: 20)),
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

