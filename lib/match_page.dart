import 'package:flutter/material.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  List<Widget> cards = [];
  int index = 0;
  final cardView = PageController();

  @override
  Widget build(BuildContext context) {
    if (cards.isEmpty){
      for (int i = 0; i < 5; i++){
        cards.add(
          Container(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Text("Carta ${i+1}"),
                ),
              ),
            ),
          ),
        );
      }
    }

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
                      child: PageView.builder(
                          onPageChanged: (int page) {
                            setState(() {
                              index = page;
                            });
                          },
                          controller: cardView,
                          itemCount: cards.length,
                          itemBuilder: (context,index) {
                            return cards[index];
                          }),
                    ),
                    Center(
                      child: Text('${index+1} of 5'),
                    ),
                    SizedBox(height: 16),
                    Row(
                        children: [
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                index--;
                                if (index < 0) index = 0;
                                cardView.animateToPage(index, duration: const Duration( microseconds: 250), curve: Curves.easeInOut);
                              });
                            },
                            child: SizedBox(
                              height: 50,
                              child: Icon(IconData(57490, fontFamily: 'MaterialIcons', matchTextDirection: true)),

                            ),
                          ),
                          Expanded(
                            flex: 50,
                            child: SizedBox(),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print("finaliza jogada");
                            },
                            child: Text('Escolher carta!'),
                          ),
                          Expanded(
                            flex: 50,
                            child: SizedBox(),
                          ),
                          GestureDetector(
                            onTap: () {
                              index++;
                              if (index > 5) index = 5;
                              cardView.animateToPage(index, duration: const Duration( microseconds: 1000), curve: Curves.linear);
                            },
                            child: SizedBox(
                              height: 50,
                              child: Icon(IconData(57499, fontFamily: 'MaterialIcons', matchTextDirection: true)),
                            ),
                          ),

                          SizedBox(width: 8),
                        ]
                    ),
                  ],
                )

            )
        )
    );
  }
}
