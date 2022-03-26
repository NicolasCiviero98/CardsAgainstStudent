import 'package:flutter/material.dart';

class EditCardsPage extends StatefulWidget {
  const EditCardsPage({Key? key}) : super(key: key);

  @override
  State<EditCardsPage> createState() => _EditCardsPageState();
}

class _EditCardsPageState extends State<EditCardsPage> {
  Color background = Colors.white;
  Color black_button_border = Colors.black;
  Color white_button_border = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Material(
        child:Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: background,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Row(
                        children: [
                          Expanded(
                            flex: 50,
                            child: DecoratedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        background = Colors.black;
                                        black_button_border = Colors.amber;
                                        white_button_border = Colors.white;
                                      });
                                    },
                                    child: Text('Pretas', style: TextStyle(fontSize: 20, color: Colors.white)),
                                    style: ElevatedButton.styleFrom( primary: Colors.black,  ),
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(border: Border.all(color: black_button_border, width: 4, style: BorderStyle.solid))
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 50,
                            child: DecoratedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        background = Colors.white;
                                        black_button_border = Colors.black;
                                        white_button_border = Colors.amber;
                                      });
                                    },
                                    child: Text('Brancas', style: TextStyle(fontSize: 20)),
                                    style: ElevatedButton.styleFrom( primary: Colors.white ),
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(border: Border.all(color: white_button_border, width: 4, style: BorderStyle.solid))
                            ),
                          ),
                        ]
                    ), // Pretas - Brancas
                    const SizedBox(height: 10),
                    Expanded(
                      flex: 1,
                      child: DecoratedBox(
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: ListView(
                                children: [
                                  SizedBox(width: 50, height:100, child: DecoratedBox(decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2.5, style: BorderStyle.solid))),),
                                  SizedBox(width: 50, height:100, child: DecoratedBox(decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2.5, style: BorderStyle.solid))),),
                                  SizedBox(width: 50, height:100, child: DecoratedBox(decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2.5, style: BorderStyle.solid))),),
                                  SizedBox(width: 50, height:100, child: DecoratedBox(decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2.5, style: BorderStyle.solid))),),
                                  SizedBox(width: 50, height:100, child: DecoratedBox(decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2.5, style: BorderStyle.solid))),),
                                  SizedBox(width: 50, height:100, child: DecoratedBox(decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2.5, style: BorderStyle.solid))),),
                                ],
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2.5, style: BorderStyle.solid))
                      ),
                    ),
                    SizedBox(height: 10),
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
                                child: Text('Voltar', style: TextStyle(fontSize: 20)),
                                style: ElevatedButton.styleFrom( primary: Colors.grey ),
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
                                  Navigator.of(context).pushNamed('/menu');
                                },
                                child: Text('Adicionar', style: TextStyle(fontSize: 20)),
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
