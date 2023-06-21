import 'package:flutter/material.dart';

main() => runApp(FormatacaoTextoApp());

class FormatacaoTextoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formatando Textos',
      home: Container(
        child: Row(
          children: [
            Text(
              'Texto para ser formatado!!!',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 40,
                fontWeight: FontWeight.normal,
                letterSpacing: 2,
                decoration: TextDecoration.none,
                //color: Colors.blue,
                color: Color(0xFF42A5F5)
              ),
            ),
          ],
        ),
      ),
    );
  }
}


