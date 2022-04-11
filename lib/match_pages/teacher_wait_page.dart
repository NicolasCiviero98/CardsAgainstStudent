import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/white_card.dart';

class TeacherWaitPage extends StatefulWidget {
  const TeacherWaitPage({Key? key}) : super(key: key);

  @override
  State<TeacherWaitPage> createState() => _TeacherWaitPageState();
}

class _TeacherWaitPageState extends State<TeacherWaitPage> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { Navigator.of(context).pushNamed('/new_match'); },
      child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Container(
                      width: 160,
                      height: 160,
                      child: Image.asset('assets/images/LogoWhite.png')
                  ),

                  Text('Room #1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
                  Text('Player: Nicolas Civiero', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
                  Text('Round Number: 1', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
                  Text('Points: 0', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white), textAlign: TextAlign.center),

                  Expanded(
                      flex: 1,
                      child: Image.asset('assets/images/Student.png')
                  ),

                  Text('Você é um estudante', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 32, color: Colors.white), textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                ],
              )
          )
      ),
    );
  }
}
