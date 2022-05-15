import 'match_list_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'menu_page.dart';
import 'match_list_page.dart';
import 'new_match_page.dart';
import 'register_page.dart';
import 'edit_cards_page.dart';
import 'new_card_page.dart';
import 'statistics_page.dart';
import 'match_pages/student_match_page.dart';
import 'match_pages/teacher_match_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cards Against Student',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/menu': (context) => MenuPage(),
        '/match_list': (context) => MatchListPage(),
        '/new_match': (context) => NewMatchPage(),
        '/register': (context) => RegisterPage(),
        '/edit_cards': (context) => EditCardsPage(),
        '/new_card': (context) => NewCardPage(),
        '/statistics': (context) => StatisticsPage(),
        '/student_match': (context) => StudentMatchPage(),
        '/teacher_match': (context) => TeacherMatchPage(),
      },
    );
  }
}
