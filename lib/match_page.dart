import 'package:flutter/material.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
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
                          Container(
                            width: 120,
                            height: 160,
                            child: Image.asset('assets/images/hand_with_cards.png'),
                          ),
                          Expanded(flex: 1, child: SizedBox(),),
                          Column(
                            children: [
                              Text('Room #1', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                              Text('Player: Caio Rutka', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                              Text('Round Number: 1', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                              Text('Points: 0', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                            ],
                          ),
                          SizedBox(width: 8),
                        ]
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      flex: 1,
                      child: PageView(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
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
