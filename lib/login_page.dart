import 'package:flutter/material.dart';

import 'menu_page.dart';
import 'register_page.dart';
import 'globals.dart' as globals;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child:SingleChildScrollView(
        child:SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/images/LogoBlack.png'),
                ),
                TextField(
                  onChanged: (text) { username = text; },
                  decoration: InputDecoration(
                    labelText: 'Usuário',
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (text) { password = text; },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/menu');
                      },
                      child: Text('Entrar', style: globals.txtStyle1),
                      style: globals.btnStyle1,
                    )
                ),
                const SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: Text('Cadastrar', style: globals.txtStyle1),
                      style: globals.btnStyle1,
                    )
                ),
              ],
            )
          )
        )
      )
    );
  }
}
