import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/white_card.dart';

class StudentMatchPage extends StatefulWidget {
  const StudentMatchPage({Key? key}) : super(key: key);

  @override
  State<StudentMatchPage> createState() => _StudentMatchPageState();
}

class _StudentMatchPageState extends State<StudentMatchPage> {
  List<Widget> cards = [];
  List<String> texts = ["Ânsia de vômito", "Gravidez na adolescência", "Brutalidade policial", "Uma festa de aniversário decepcionante", "Injeções hormonais"];
  int index = 0;
  final cardView = PageController();

  showBlackCard(BuildContext context) {
    TextEditingController customController = new TextEditingController();
    return showDialog(context: context, builder: (context) {
      return Container(
        child: Center(

          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            //color: Colors.red,
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    const Expanded(flex: 1, child: SizedBox(),),
                    Stack(
                      children: <Widget>[
                        Image.asset('assets/images/BlackCard.png'),
                        Container(
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(32, 44, 40, 32),
                            child: Text(
                              "No novo filme da Disney, Hanna Montana enfrenta __________ pela primeira vez.",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white, decoration: TextDecoration.none),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Expanded(flex: 1, child: SizedBox(),),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {

    return Material(
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Row(
                  children: [
                    const Expanded(flex: 1,child: SizedBox(),),
                    Container(
                      width: 120,
                      height: 180,
                      child: Image.asset('assets/images/Student.png'),
                    ),
                  ],
                )
              ],
            )
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Row(
                          children: [
                            Container(
                              width: 100,
                              height: 110,
                              child: GestureDetector(
                                onTap: () { showBlackCard(context); }, // Image tapped
                                child: Image.asset('assets/images/BlackCard.png'),
                              ),
                            ),
                            //Expanded(flex: 1, child: SizedBox(),),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Room #1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                Text('Player: Caio Rutka', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
                                Text('Round Number: 1', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
                                Text('Points: 0', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
                                Text('Role: Student', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
                              ],
                            ),
                            const SizedBox(width: 8),
                          ]
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        flex: 1,
                        child: PageView(
                          controller: cardView,
                          onPageChanged: (int page) { setState(() { index = page; }); },
                          children: texts.map((text) => WhiteCard(
                            content: text,
                          )).toList(),
                        ),
                      ),
                      Center(
                        child: Text('${index+1} of 5', style: const TextStyle(fontSize: 16),),
                      ),
                      const SizedBox(height: 16),
                      Row(
                          children: [
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed:  () {
                                setState(() {
                                  index--;
                                  if (index < 0) index = 0;
                                  cardView.animateToPage(index, duration: const Duration( microseconds: 300000), curve: Curves.decelerate);
                                });
                              },
                              child: const Icon(IconData(57490, fontFamily: 'MaterialIcons', matchTextDirection: true), color: Colors.black,),
                            ),
                            const Expanded(
                              flex: 50,
                              child: SizedBox(),
                            ),
                            SizedBox(
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () { Navigator.of(context).pushReplacementNamed('/teacher_match'); },
                                child: Text('Escolher carta!', style: globals.txtStyle1,),
                                style: globals.btnStyle1,
                              ),
                            ),
                            const Expanded(
                              flex: 50,
                              child: SizedBox(),
                            ),
                            TextButton(
                              onPressed:  () {
                                setState(() {
                                  index++;
                                  if (index > 5) index = 5;
                                  cardView.animateToPage(index, duration: const Duration( microseconds: 300000), curve: Curves.decelerate);
                                });
                              },
                              child: const Icon(IconData(57499, fontFamily: 'MaterialIcons', matchTextDirection: true), color: Colors.black,),
                            ),
                            const SizedBox(width: 8),
                          ]
                      ),
                    ],
                  )
              )
          ),
        ],
      ),
    );
  }
}
