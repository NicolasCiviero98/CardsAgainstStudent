import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/white_card.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  List<Widget> cards = [];
  String black_card = '';
  List<String> white_cards = [];
  int index = 0;
  bool teacher = false;
  bool cardChosen = false;
  String room = '';
  String stage = '';
  int score = 0;
  int round = 0;


  final cardView = PageController();

  showBlackCard(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Center(
            child: Column(
              children: [
                const Expanded(flex: 1, child: SizedBox(),),
                Stack(
                  children: <Widget>[
                    Image.asset('assets/images/BlackCard.png'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(32, 44, 40, 32),
                      child: Text(
                        black_card,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white, decoration: TextDecoration.none),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                const Expanded(flex: 1, child: SizedBox(),),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void initState() {

    globals.socket!.on("roundUpdate", (data) {
      Navigator.pushNamed( context, '/match', arguments: data);
    });

  }


  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    teacher = arguments['role'] == 'teacher';
    stage = arguments['stage'];
    score = arguments['score'];
    round = arguments['round'];
    room = arguments['room'];

    black_card = arguments['black_card'];
    if (arguments['white_cards'] != null){
      white_cards.clear();
      arguments['white_cards'].forEach((var card) => white_cards.add(card));
    }

    return Material(
      child: Stack(
        children: [
          Background(),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Header(),
                      const SizedBox(height: 16),
                      Expanded(
                          flex: 1,
                          child: CardsList()
                      ),
                      Center(
                        child: white_cards.isEmpty ?
                        const SizedBox(height: 16,) :
                        Text('${index+1} of ${white_cards.length}', style: const TextStyle(fontSize: 16),),
                      ),
                      const SizedBox(height: 16),
                      Footer(),
                    ],
                  )
              )
          ),
        ],
      ),
    );
  }

  Widget Background() => Column(
    children: [
      const SizedBox(height: 40,),
      Row(
        children: [
          const Expanded(flex: 1,child: SizedBox(),),
          Container(
            width: 120,
            height: 180,
            child: teacher ?
            Image.asset('assets/images/Teacher.png') :
            Image.asset('assets/images/Student.png'),
          ),
        ],
      )
    ],
  );

  Widget Header() => Row(
      children: [
        SizedBox(
          width: 100,
          height: 110,
          child: GestureDetector(
            onTap: () {
              if (!(teacher && stage == 'students')){
                showBlackCard(context);
              }
            }, // Image tapped
            child: Image.asset('assets/images/BlackCard.png'),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(room, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('Jogador: ${globals.username}', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
            Text('Rodada: ${round}', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
            Text('Pontos: ${score}', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
            Text('Papel: ${teacher ? 'Professor' : 'Aluno'}', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
          ],
        ),
        const SizedBox(width: 8),
      ]
  );

  Widget CardsList() => (teacher && stage == 'students') ?
  BlackCard(content: black_card) :
  PageView.builder(
      itemCount: white_cards.length,
      controller: cardView,
      itemBuilder: (context, index) {
        final text = white_cards[index];
        return WhiteCard(content: text);
      });

  Widget Footer() {
    if(teacher){
      if(stage == 'students'){
        return Text('Aguardando alunos', style: globals.txtStyle1);
      }
      if(stage == 'teacher' && !cardChosen){
        return Row(
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
                  onPressed: () {
                    globals.socket!.emit('chooseCard', {'role': 'teacher', 'card': white_cards[index]});
                    cardChosen = true;
                  },
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
                    if (index >= white_cards.length) index = white_cards.length - 1;
                    cardView.animateToPage(index, duration: const Duration( microseconds: 300000), curve: Curves.decelerate);
                  });
                },
                child: const Icon(IconData(57499, fontFamily: 'MaterialIcons', matchTextDirection: true), color: Colors.black,),
              ),
              const SizedBox(width: 8),
            ]
        );
      }
    }
    else{
      if(stage == 'students' && !cardChosen){
        return Row(
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
                  onPressed: () {
                    globals.socket!.emit('chooseCard', {'role': 'student', 'card': white_cards[index]});
                    cardChosen = true;
                    },
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
                    if (index >= white_cards.length) index = white_cards.length - 1;
                    cardView.animateToPage(index, duration: const Duration( microseconds: 300000), curve: Curves.decelerate);
                  });
                },
                child: const Icon(IconData(57499, fontFamily: 'MaterialIcons', matchTextDirection: true), color: Colors.black,),
              ),
              const SizedBox(width: 8),
            ]
        );
      }
      if(stage == 'teacher'){
        return Row(
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
                child: Center(
                  child: Text('Aguardando professor', style: globals.txtStyle1),
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
                    if (index >= white_cards.length) index = white_cards.length - 1;
                    cardView.animateToPage(index, duration: const Duration( microseconds: 300000), curve: Curves.decelerate);
                  });
                },
                child: const Icon(IconData(57499, fontFamily: 'MaterialIcons', matchTextDirection: true), color: Colors.black,),
              ),
              const SizedBox(width: 8),
            ]
        );
      }
    }

    return Text('Carta escolhida', style: globals.txtStyle1);
  }
}
