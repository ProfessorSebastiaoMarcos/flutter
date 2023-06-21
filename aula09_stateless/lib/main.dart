import 'package:flutter/material.dart';

main() => runApp(const EstaticoApp());

class EstaticoApp extends StatelessWidget {
  const EstaticoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WidgetImutavel(),
    );
  }
}

class WidgetImutavel extends StatelessWidget {
  const WidgetImutavel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App Stateless'),
        backgroundColor: Colors.amber,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text('Conteúdo do App Stateless'),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.lightBlue,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Texto 1'),
              Text(
                'Texto 2',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Text('Texto 3')
            ],
          ),
        ),
      ),
    );
  }
}

