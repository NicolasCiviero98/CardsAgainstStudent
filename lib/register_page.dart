import 'package:cards_against_student/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = '';
  String email = '';
  String password = '';

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
                      decoration: InputDecoration(
                          labelText: 'Usuário',
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (text) { email = text; },
                      decoration: InputDecoration(
                          labelText: 'E-mail',
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (text) { password = text; },
                      decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (text) { password = text; },
                      decoration: InputDecoration(
                          labelText: 'Repetir senha',
                          border: OutlineInputBorder()
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
                                  Navigator.of(context).pushNamed('/login');
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
                                  Navigator.of(context).pushNamed('/login');
                                },
                                child: Text('Cadastrar', style: TextStyle(fontSize: 20)),
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
