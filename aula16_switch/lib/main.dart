import 'package:flutter/material.dart';

main() => runApp(
      const MaterialApp(
        home: SwitchApp(),
      ),
    );

class SwitchApp extends StatefulWidget {
  const SwitchApp({super.key});

  @override
  State<SwitchApp> createState() => _SwitchAppState();
}

class _SwitchAppState extends State<SwitchApp> {
  //Declarações
  bool _selecaoEstado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App com botão Switch'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Text('News Letter'),
            //Botão Switch
            Switch(
              value: _selecaoEstado,
              onChanged: (bool estado) {
                //Troca do Estado
                setState(
                  () {
                    _selecaoEstado = estado;
                  },
                );
              },
            ),
            //Apresentação do estado (True e False)
            Text('Estado atual: $_selecaoEstado')
          ],
        ),
      ),
      //BottomBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0,
        //Criando uma lista de itens para a Barra de navegação
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

