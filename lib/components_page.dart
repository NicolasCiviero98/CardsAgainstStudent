import 'dart:ffi';

import 'package:flutter/material.dart';

// class CardTypeSelector extends StatefulWidget {
//   final bool whiteSelected;
//
//   CardTypeSelector(this.whiteSelected);
//
//   @override
//   State<CardTypeSelector> createState() => _CardTypeSelectorState();
// }
//
// class _CardTypeSelectorState extends State<CardTypeSelector> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         children: [
//           Expanded(
//             flex: 50,
//             child: DecoratedBox(
//                 child: Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: SizedBox(
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           black_button_border = Colors.amber;
//                           white_button_border = Colors.white;
//                         });
//                       },
//                       child: Text('Pretas', style: TextStyle(fontSize: 20, color: Colors.white)),
//                       style: ElevatedButton.styleFrom( primary: Colors.black,  ),
//                     ),
//                   ),
//                 ),
//                 decoration: BoxDecoration(border: Border.all(color: black_button_border, width: 4, style: BorderStyle.solid))
//             ),
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             flex: 50,
//             child: DecoratedBox(
//                 child: Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: SizedBox(
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           background = Colors.white;
//                           black_button_border = Colors.black;
//                           white_button_border = Colors.amber;
//                         });
//                       },
//                       child: Text('Brancas', style: TextStyle(fontSize: 20)),
//                       style: ElevatedButton.styleFrom( primary: Colors.white ),
//                     ),
//                   ),
//                 ),
//                 decoration: BoxDecoration(border: Border.all(color: white_button_border, width: 4, style: BorderStyle.solid))
//             ),
//           ),
//         ]
//     );
//   }
// }
