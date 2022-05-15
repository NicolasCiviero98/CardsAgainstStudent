import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'mobile.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  Color background = Colors.white;

  int total_matches = 0;
  int total_turns = 0;
  int win_matches = 0;
  int win_turns = 0;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    var username = arguments['username'];

    return Material(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 80,
                        child: FittedBox(
                          child: Text(
                            'Estatísticas',
                            style: TextStyle(fontSize: 50),
                          ),
                        )),
                    SizedBox(height: 10),
                    Expanded(
                      flex: 1,
                      child: DecoratedBox(
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Usuario: $username',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    'Número de partidas: $total_matches',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    'Número de rodadas: $total_turns',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    'Partidas ganhas: $win_matches',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    'Rodadas ganhas: $win_turns',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 2.5,
                                  style: BorderStyle.solid))),
                    ),
                    SizedBox(height: 10),
                    Row(children: [
                      Expanded(
                        flex: 50,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/menu');
                            },
                            child:
                                Text('Voltar', style: TextStyle(fontSize: 20)),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.grey),
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
                              createPdf(username);
                            },
                            child: Text('Pdf', style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ))));
  }

  Future<void> createPdf(String user) async {
    //setup
    PdfDocument document = PdfDocument();
    document.pageSettings.margins.all = 0;
    final page = document.pages.add();
    PdfGraphics graphics = page.graphics;
    var font = PdfStandardFont(PdfFontFamily.helvetica, 30);

    //drawing
    //graphics.drawRectangle(brush: PdfSolidBrush(PdfColor(165, 42, 42)),bounds: Rect.fromLTWH(0, 0, page.getClientSize().width, page.getClientSize().height));
    double centerX = page.getClientSize().width / 2;
    graphics.drawImage(PdfBitmap(await _readImageData('Cards3.png')),
        const Rect.fromLTRB(-30, 50, 180, 260));
    graphics.drawImage(PdfBitmap(await _readImageData('LogoBlack.png')),
        Rect.fromLTRB(centerX - 120, 40, centerX + 200, 230));
    graphics.drawImage(
        PdfBitmap(await _readImageData('Cards2.png')),
        Rect.fromLTRB(
            page.getClientSize().width - 180,
            page.getClientSize().height - 180,
            page.getClientSize().width + 40,
            page.getClientSize().height));
    double textStart = 300;
    graphics.drawString("Username: $user", font,
        bounds: Rect.fromLTWH(150, textStart, 0, 0));
    graphics.drawString("Número de Partidas: $total_matches", font,
        bounds: Rect.fromLTWH(150, textStart + 50, 0, 0));
    graphics.drawString("Número de Rodadas: $total_turns", font,
        bounds: Rect.fromLTWH(150, textStart + 100, 0, 0));
    graphics.drawString("Partidas ganhas: $win_matches", font,
        bounds: Rect.fromLTWH(150, textStart + 150, 0, 0));
    graphics.drawString("Rodadas ganhas: $win_turns", font,
        bounds: Rect.fromLTWH(150, textStart + 200, 0, 0));

    //saving
    List<int> bytes = document.save();
    document.dispose();
    saveAndLaunchFile(bytes, 'Output.pdf');
  }

  Future<Uint8List> _readImageData(String name) async {
    final data = await rootBundle.load('assets/images/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
