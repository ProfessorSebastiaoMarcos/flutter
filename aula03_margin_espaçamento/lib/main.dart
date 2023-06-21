import 'package:flutter/material.dart';

//Alterar arquivo pubspec.yaml: environment: sdk: '>=2.18.2 <4.0.0'
main() => runApp(const MargemPaddingApp());

class MargemPaddingApp extends StatelessWidget {
  const MargemPaddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Removendo a faixa de Debug
      debugShowCheckedModeBanner: false,
      title: 'Margens e Espaçamentos',
      home: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          border: Border.all(width: 5, color: Colors.amber),
        ),
        child: const Column(
          children: [
            Text(
              'Texto para visualização das formatações do App!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

