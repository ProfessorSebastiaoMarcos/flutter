//Botões Radio
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: BotaoRadio(),
    ));

class BotaoRadio extends StatefulWidget {
  const BotaoRadio({super.key});

  @override
  _BotaoRadioState createState() => _BotaoRadioState();
}

class _BotaoRadioState extends State<BotaoRadio> {
  //Variável para capturar o valor do botão
  int? _opcao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App Botão Radio'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            RadioListTile(
                title: const Text('Opção 1'),
                value: 1,
                groupValue: _opcao,
                onChanged: (int? selecao) {
                  setState(() {
                    _opcao = selecao;
                  });
                }),
            RadioListTile(
                title: const Text('Opção 2'),
                value: 2,
                groupValue: _opcao,
                onChanged: (int? selecao) {
                  setState(() {
                    _opcao = selecao;
                  });
                }),
            ElevatedButton(
              onPressed: () {
                print('Seleção:');
                print('Opção escolinha: $_opcao');
              },
              child: const Text('Fazer o pedido'),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'chat',
            )
          ]),
    );
  }
}

