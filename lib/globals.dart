library CardsAgainstStudent.globals;

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

TextStyle txtStyle1 = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, decoration: TextDecoration.none);
IO.Socket? socket;
String username = "NoName";

ButtonStyle btnStyle1 = ElevatedButton.styleFrom(
  primary: Colors.black,
  onPrimary: Colors.white,
  elevation: 5,
  shadowColor: Colors.grey,
);

