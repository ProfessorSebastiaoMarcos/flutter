import 'package:flutter/material.dart';

main() => runApp(const MaterialApp(
      home: AppSwitchList(),
    ));

class AppSwitchList extends StatefulWidget {
  const AppSwitchList({super.key});

  @override
  _AppSwitchListState createState() => _AppSwitchListState();
}

class _AppSwitchListState extends State<AppSwitchList> {
  bool _modoCor = false;
  bool _modoSepia = false;
  bool _modoRed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Switch List',
        ),
        backgroundColor: Colors.red[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //Criar o switch
            SwitchListTile(
                title: const Text(
                  'Modo Colorido',
                  style: TextStyle(color: Colors.blueGrey),
                ),
                subtitle: const Text(
                  'Teste SwitchListTile',
                ),
                activeColor: Colors.blueGrey,
                secondary: const Icon(Icons.monitor),
                value: _modoCor,
                onChanged: (bool estado1) {
                  setState(() {
                    _modoCor = estado1;
                  });
                }),

            SwitchListTile(
                title: Text(
                  'Modo Colorido',
                  style: TextStyle(color: Colors.orange.shade100),
                ),
                subtitle: const Text(
                  'Teste SwitchListTile',
                ),
                activeColor: Colors.orange.shade100,
                secondary: const Icon(Icons.monitor),
                value: _modoSepia,
                onChanged: (bool estado2) {
                  setState(() {
                    _modoSepia = estado2;
                  });
                }),

            SwitchListTile(
                title: Text(
                  'Modo Colorido',
                  style: TextStyle(color: Colors.red.shade600),
                ),
                subtitle: const Text(
                  'Teste SwitchListTile',
                ),
                activeColor: Colors.red.shade600,
                secondary: const Icon(Icons.monitor),
                value: _modoRed,
                onChanged: (bool estado3) {
                  setState(() {
                    _modoRed = estado3;
                  });
                }),
            ElevatedButton(
              onPressed: () {
                //Prints para testar no Terminal
                print('Modo Cor: $_modoCor');
                print('Modo Sepia: $_modoSepia');
                print('Modo Red: $_modoRed');
              },
              child: const Text('Configurar'),
            )
          ],
        ),
      ),
      //BottomBar
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
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}

