import 'package:cards_against_student/widgets/card_list_item.dart';
import 'package:cards_against_student/widgets/player_item.dart';
import 'package:flutter/material.dart';

class EditCardsPage extends StatefulWidget {
  const EditCardsPage({Key? key}) : super(key: key);

  @override
  State<EditCardsPage> createState() => _EditCardsPageState();
}

class _EditCardsPageState extends State<EditCardsPage> {
  bool black_selected = false;
  Color background = Colors.white;
  Color black_button_border = Colors.black;
  Color white_button_border = Colors.amber;
  List<String> cards = ["Ânsia de vômito", "Gravidez na adolescência", "Brutalidade policial", "Uma festa de aniversário decepcionante", "Injeções hormonais", "Ânsia de vômito", "Gravidez na adolescência", "Brutalidade policial", "Uma festa de aniversário decepcionante", "Injeções hormonais", "Ânsia de vômito", "Gravidez na adolescência", "Brutalidade policial", "Uma festa de aniversário decepcionante", "Injeções hormonais", "Ânsia de vômito", "Gravidez na adolescência", "Brutalidade policial", "Uma festa de aniversário decepcionante", "Injeções hormonais"];

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
                                        black_selected = true;
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
                                        black_selected = false;
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
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 48,
                            width: double.infinity,
                            color:Color.fromARGB(40, 125, 125, 125),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                              child: ListView(
                                children: cards.map((text) => CardListItem(
                                  content: text,
                                  edit: () {},
                                  delete: () {},
                                  is_black: black_selected,
                                )).toList(),
                              )
                            ),
                          )
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
