import 'package:flutter/material.dart';

main() => runApp(const BotaoTextoApp());

class BotaoTextoApp extends StatelessWidget {
  const BotaoTextoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Botões de Texto',
      home: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TEXT BUTTON
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: Colors.pinkAccent,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 32,
                ),
              ),
              onPressed: () {
                print('O botão foi pressionado!');
              },
              child: const Text(
                'Meu botão A',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            //Forçar o espaçamento
            const SizedBox(
              height: 20,
            ),

            //ELEVATE BUTTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                //cor Bckground
                backgroundColor: Colors.amber,
                //cor foreground
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                print('Ação ao pressionar o botão!');
              },
              child: const Text(
                'Meu Botão',
                style: TextStyle(fontSize: 20),
              ),
            ),
            //Forçar o espaçamento
            const SizedBox(
              height: 20,
            ),

            //OUTLINE BUTTON
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                //Cor do foreground
                foregroundColor: const Color(0xFFFCFAFA),
                //Cor da borda
                side: const BorderSide(
                  width: 1,
                  color: Colors.orange,
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Meu Botão',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            //Forçar o espaçamento
            const SizedBox(
              height: 20,
            ),
            //ICON BUTTON
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  width: 1,
                  color: Colors.amber,
                ),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.add_a_photo,
                color: Colors.white,
              ),
              label: const Text('Label do botão'),
            ),
            //Forçar o espaçamento
            const SizedBox(
              height: 20,
            ),
            //DISABLE BUTTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                disabledForegroundColor: Colors.red[200],
              ),
              onPressed: null,
              child: const Text(
                'Botão desativado!',
                style: TextStyle(
                  fontSize: 25,
                  //color: Colors.white
                ),
              ),
            ),
            //Forçar o espaçamento
            const SizedBox(
              height: 20,
            ),
            //Repita o Widget aqui!!!
          ],
        ),
      ),
    );
  }
}
