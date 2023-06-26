import 'package:flutter/material.dart';

main() => runApp(
      const MaterialApp(
        home: CheckBoxListTileApp(),
      ),
    );

class CheckBoxListTileApp extends StatefulWidget {
  const CheckBoxListTileApp({super.key});

  @override
  State<CheckBoxListTileApp> createState() => _CheckBoxListTileAppState();
}

class _CheckBoxListTileAppState extends State<CheckBoxListTileApp> {
  bool _pizzaMerguerita = false;
  bool _pizzaCalabreza = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App com lista de seleção'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // Esticar o consteúdo
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CheckboxListTile(
              title: const Text('Pizza Marguerita'),
              subtitle: const Text('Tomate, cebola, mangericão, queijo'),
              //Cor do Checkboxlist
              activeColor: Colors.black,
              //Cor do Texto
              selected: true,
              //Definindo um ícone
              secondary: const Icon(Icons.add_box),
              value: _pizzaCalabreza,
              onChanged: (bool? valor) {
                setState(() {
                  _pizzaCalabreza = valor!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Pizza Calabreza'),
              subtitle: const Text('Calabreza, cebola, queijo'),
              //Cor do Checkboxlist
              activeColor: Colors.black,
              //Cor do Texto
              selected: true,
              //Definindo um ícone
              secondary: const Icon(Icons.add_box),
              value: _pizzaMerguerita,
              onChanged: (bool? valor) {
                setState(() {
                  _pizzaMerguerita = valor!;
                });
              },
            ),
            //Criando um botão
            ElevatedButton(
              onPressed: () {
                print('Pedido:');
                print('Pizza Marguerita: $_pizzaMerguerita');
                print('Pizza Calabreza: $_pizzaCalabreza');
              },
              child: const Text('Fazer o pedido'),
            )
          ],
        ),
      ),

      //BottomBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0,
        //Crianado uma lista de itens para a Barra de navegação
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
            label: 'Chat',
          ),

        ],
      ),
    );
  }
}


