import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = '';
  String email = '';
  String password = '';
  String passwordCheck = '';

  void register(String username, String pass) async {
    try {
      Response response = await post(
          Uri.parse('http://192.168.0.12:3000/user'),
          body: {'username': username,'userKind': 'User', 'password': pass});

      if (response.statusCode == 200) {
        Alert(
          context: context,
          title: "Success",
          desc: "Novo Usuário Cadastrado!",
          buttons: [
            DialogButton(
              child: const Text(
                "Ok!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      } else {
        Alert(
          context: context,
          title: "Error",
          desc: "Erro ao cadastrar usuário!",
          buttons: [
            DialogButton(
              child: const Text(
                "Ok!",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
                      decoration: const InputDecoration(
                          labelText: 'Usuário',
                          border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      onChanged: (text) { email = text; },
                      decoration: const InputDecoration(
                          labelText: 'E-mail',
                          border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      onChanged: (text) { password = text; },
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      onChanged: (text) { passwordCheck = text; },
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Repetir senha',
                          border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                        children: [
                          Expanded(
                            flex: 50,
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/login');
                                },
                                child: const Text('Voltar', style: TextStyle(fontSize: 20)),
                                style: ElevatedButton.styleFrom( primary: Colors.grey ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 50,
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  register(username, password);
                                  Navigator.of(context).pushNamed('/login');
                                },
                                child: const Text('Cadastrar', style: TextStyle(fontSize: 20)),
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
