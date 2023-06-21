import 'package:flutter/material.dart';

main() => runApp(const AlinhamentoApp());

class AlinhamentoApp extends StatelessWidget {
  const AlinhamentoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alinhamentos',
      home: Container(
        margin: const EdgeInsets.only(top: 60),
        decoration: BoxDecoration(
            border: Border.all(
          width: 5,
          color: Colors.blue,
        )),
        child: const Row(
          //Alinhando minha Row
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //Eixo que cruza o alinhamento principal
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              'A-1',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 30,
              ),
            ),
            Text(
              'A-2',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 30,
              ),
            ),
            Text(
              'A-3',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}


