import 'package:flutter/material.dart';

class WhiteCard extends StatelessWidget {
  final String content;
  WhiteCard({ required this.content });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Stack(
          children: <Widget>[
            Image.asset('assets/images/WhiteCard.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 44, 40, 32),
              child: Text(content,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black, decoration: TextDecoration.none),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}