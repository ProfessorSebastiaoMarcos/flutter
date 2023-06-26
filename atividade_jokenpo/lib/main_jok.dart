import 'package:flutter/material.dart';
import 'dart:math';

main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Jokenpo(),
    ));

class Jokenpo extends StatefulWidget {
  const Jokenpo({super.key});

  @override
  _JokenpoState createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {
  dynamic _imagem = const AssetImage('images/padrao.png');
  String _resultado = 'You Vs Bot';

  jogada(String escolha) {
    // 1 pedra ganha de tesoura e perde para papel
    // 2 papel ganha de pedra e perde para tesoura
    // 3 tesoura ganha de papel e perde para pedra

    Random random = Random();

    int bot = random.nextInt(3) + 1;

    // Derrota
    if (escolha == 'pedra' && bot == 2) {
      _resultado = 'Bot Ganhou!';
      _imagem = const AssetImage('images/papel.png');
    } else if (escolha == 'papel' && bot == 3) {
      _resultado = 'Bot Ganhou!';
      _imagem = const AssetImage('images/pedra.png');
    } else if (escolha == 'tesoura' && bot == 1) {
      _resultado = 'Bot Ganhou!';
      _imagem = const AssetImage('images/pedra.png');
    }

    // Empate
    else if (escolha == 'pedra' && bot == 3) {
      _resultado = 'Você Venceu!!!';
      _imagem = const AssetImage('images/tesoura.png');
    } else if (escolha == 'papel' && bot == 1) {
      _resultado = 'Você Venceu!!!';
      _imagem = const AssetImage('images/pedra.png');
    } else if (escolha == 'tesoura' && bot == 2) {
      _resultado = 'Você Venceu!!!';
      _imagem = const AssetImage('images/papel.png');
    }

    // EVitória
    else if (escolha == 'pedra' && bot == 1) {
      _resultado = 'Empate!';
      _imagem = const AssetImage('images/pedra.png');
    } else if (escolha == 'papel' && bot == 2) {
      _resultado = 'Empate!';
      _imagem = const AssetImage('images/papel.png');
    } else if (escolha == 'tesoura' && bot == 3) {
      _resultado = 'Empate!';
      _imagem = const AssetImage('images/tesoura.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokenpo'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Column para o Primeiro texto 
          // e a jogada do bot ficarem no meio da tela
          Column(
            children: [
              // Texto da escolha do app
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 5),
                child: Text(
                  'Escolha do App',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Imagem da jogada do bot
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 40),
                child: Column(
                  children: [
                    Image(
                      image: _imagem,
                      width: 130,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 30),
                child: Text(
                  _resultado,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    jogada('pedra');
                  });
                },
                child: Image.asset(
                  'images/pedra.png',
                  width: 100,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    jogada('papel');
                  });
                },
                child: Image.asset(
                  'images/papel.png',
                  width: 100,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    jogada('tesoura');
                  });
                },
                child: Image.asset(
                  'images/tesoura.png',
                  width: 100,
                ),
              ),
            ],
          ),
        ],
      ),
      //BottomBar
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação do botão flutuante
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Ação do ícone de home
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Ação do ícone de pesquisa
              },
            ),
            SizedBox(width: 48.0),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Ação do ícone de notificações
              },
            ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Ação do ícone de menu
              },
            ),
          ],
        ),
      ),
    );
  }
}
