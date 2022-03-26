import 'package:flutter/material.dart';

class NewCardPage extends StatefulWidget {
  const NewCardPage({Key? key}) : super(key: key);

  @override
  State<NewCardPage> createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  Color background = Colors.white;
  String card_text = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: background,
          //child: DecoratedBox( decoration: BoxDecoration(color: background),),
        ),
        Material(
            child:SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            children: [
                              Expanded(
                                flex: 50,
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      background = Colors.black;
                                    },
                                    child: Text('Pretas', style: TextStyle(fontSize: 20)),
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
                                      background = Colors.white;
                                    },
                                    child: Text('Brancas', style: TextStyle(fontSize: 20)),
                                  ),
                                ),
                              ),
                            ]
                        ), // Pretas - Brancas
                        SizedBox(height: 10),
                        TextField(
                          onChanged: (text) { card_text = text; },
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
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

        )
      ],
    );
  }
}
