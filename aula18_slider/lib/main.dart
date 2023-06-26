import 'package:flutter/material.dart';

main() => runApp(const MaterialApp(
      home: AppSlider(),
    ));

class AppSlider extends StatefulWidget {
  const AppSlider({super.key});

  @override
  _AppSliderState createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  double _valorSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Layout Básico',
        ),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Slider(
                value: _valorSlider,
                min: 0,
                max: 10,
                //Definindo um label no slider
                label: _valorSlider.toStringAsFixed(2),
                divisions: 10,
                activeColor: Colors.amber.shade200,
                inactiveColor: Colors.grey,
                onChanged: (double valorAlterado) {
                  setState(() {
                    _valorSlider = valorAlterado;
                  });
                }),
            ElevatedButton(
              onPressed: () {
                //Print para testar no terminal
                print(
                  'Valor selecionado: ${_valorSlider.toStringAsFixed(2)}',
                ); //Saída no terminal
              },
              child: const Text(
                'Capturar',
              ),
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
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}

