import 'package:flutter/material.dart';

class PlayerItem extends StatelessWidget {
  final String username;
  final Function delete;
  PlayerItem({ required this.username, required this.delete });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      child: Card(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12,0,6,0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(username, style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                width: 30,
                child: TextButton(
                  onPressed: () { delete; },
                  child: Text("X", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, decoration: TextDecoration.none, color: Colors.black, fontFamily: "Arial"),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}