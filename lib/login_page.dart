import 'package:flutter/material.dart';

import 'menu_page.dart';
import 'register_page.dart';

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
                TextField(
                  onChanged: (text) { username = text; },
                  decoration: InputDecoration(
                    labelText: 'Usuário',
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (text) { password = text; },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => MenuPage())
                        );
                      },
                      child: Text('Entrar'),
                    )
                ),
                SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => RegisterPage())
                        );
                      },
                      child: Text('Cadastrar'),
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
