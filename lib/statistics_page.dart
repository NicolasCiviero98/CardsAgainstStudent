import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  Color background = Colors.white;

  int total_matches = 0;
  int total_turns = 0;
  int win_matches = 0;
  int win_turns = 0;

  @override
  Widget build(BuildContext context) {
    return
      Material(
          child:SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Container(
                          width: MediaQuery.of(context).size.width - 50,
                          height: 80,
                          child: FittedBox(
                            child: Text(
                              'Estatísticas',
                              style: TextStyle(fontSize: 50),
                            ),
                          )
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        flex: 1,
                        child: DecoratedBox(
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text( 'Número de partidas: $total_matches', style: TextStyle(fontSize: 25), ),
                                    Text( 'Número de rodadas: $total_turns', style: TextStyle(fontSize: 25), ),
                                    Text( 'Partidas ganhas: $win_matches', style: TextStyle(fontSize: 25), ),
                                    Text( 'Rodadas ganhas: $win_turns', style: TextStyle(fontSize: 25), ),
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
                                    print('not implemented yet');
                                  },
                                  child: Text('Compartilhar', style: TextStyle(fontSize: 20)),
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
