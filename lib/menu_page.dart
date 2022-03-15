import 'package:cards_against_student/login_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
                    SizedBox(
                      width: double.infinity,
                      child:   ElevatedButton(
                        onPressed: () {
                          print('not implemented');
                        },
                        child: Text('Criar sala'),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          print('not implemented');
                        },
                        child: Text('Estatísticas'),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          print('not implemented');
                        },
                        child: Text('Editar cartas'),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => LoginPage())
                          );
                        },
                        child: Text('Deslogar'),
                      ),
                    ),
                  ],
                )
            )
        )

    );
  }
}
