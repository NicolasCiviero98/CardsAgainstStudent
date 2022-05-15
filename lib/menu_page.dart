import 'login_page.dart';
import 'new_match_page.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    var username = arguments['username'];

    return Material(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: 160,
                      height: 240,
                      child: Image.asset('assets/images/LogoBlack.png'),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/match_list',
                            arguments: {'username': username},
                          );
                        },
                        child: Text('Encontrar Sala', style: globals.txtStyle1),
                        style: globals.btnStyle1,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/statistics',
                            arguments: {'username': username},
                          );
                        },
                        child: Text('Estatísticas', style: globals.txtStyle1),
                        style: globals.btnStyle1,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/edit_cards');
                        },
                        child: Text('Editar cartas', style: globals.txtStyle1),
                        style: globals.btnStyle1,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        child: Text('Deslogar', style: globals.txtStyle1),
                        style: globals.btnStyle1,
                      ),
                    ),
                  ],
                ))));
  }
}
