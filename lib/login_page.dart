import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  Future<String> login(String username, String pass) async {
    try {
      Response response = await post(
          Uri.parse('http://192.168.0.11:3000/user/login'),
          body: {'username': username, 'password': pass});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return (data['status']);
      } else {
        return ('FAIL');
      }
    } catch (e) {
      return (e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            child: SizedBox(
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
                          onChanged: (text) {
                            username = text;
                          },
                          decoration: InputDecoration(
                              labelText: 'Usuário',
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          onChanged: (text) {
                            password = text;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Senha', border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                            width: double.infinity,
                            height: 44,
                            child: ElevatedButton(
                              onPressed: () {
                                login(username.toString(), password.toString())
                                    .then((value) {
                                  if (value == 'ACHOU') {
                                    Navigator.pushNamed(
                                      context,
                                      '/menu',
                                      arguments: {'username': username},
                                    );
                                    //Navigator.of(context).pushNamed('/menu');
                                  } else if (value == 'NAOACHOU') {
                                    Alert(
                                      context: context,
                                      title: "Error",
                                      desc: "Erro ao efetuar Login!",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Ok!",
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                          ),
                                          onPressed: () => Navigator.pop(context),
                                          width: 120,
                                        )
                                      ],
                                    ).show();
                                  }
                                });
                              },
                              child: Text('Entrar', style: globals.txtStyle1),
                              style: globals.btnStyle1,
                            )),
                        const SizedBox(height: 10),
                        SizedBox(
                            width: double.infinity,
                            height: 44,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/register');
                              },
                              child:
                                  Text('Cadastrar', style: globals.txtStyle1),
                              style: globals.btnStyle1,
                            )),
                      ],
                    )))));
  }
}
