import 'package:flutter/material.dart';

class CardListItem extends StatelessWidget {
  final String content;
  final Function edit;
  final Function delete;
  final bool is_black;
  CardListItem({ required this.content, required this.edit, required this.delete, required this.is_black });

  @override
  Widget build(BuildContext context) {
    Color background = is_black ? Colors.black : Colors.white;
    Color foreground = is_black ? Colors.white70 : Colors.black;

    return Container(
      height: 52,
      child: Card(
        color: background,
        child: Padding(
          padding: EdgeInsets.fromLTRB(12,0,6,0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(content, style: TextStyle(fontSize: 20, color: foreground)),
              ),
              SizedBox(
                width: 30,
                child: TextButton(
                  onPressed: () { edit; },
                  child: Icon(IconData(0xe21a, fontFamily: 'MaterialIcons', matchTextDirection: true), color: foreground,),
                ),
              ),
              SizedBox(
                width: 30,
                child: TextButton(
                  onPressed: () { delete; },
                  child: Icon(IconData(0xe16a, fontFamily: 'MaterialIcons', matchTextDirection: true), color: foreground,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}