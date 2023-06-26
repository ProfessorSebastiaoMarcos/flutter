import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom App Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom App Bar Demo'),
      ),
      body: Center(
        child: Text('Hello, World!'),
      ),
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
