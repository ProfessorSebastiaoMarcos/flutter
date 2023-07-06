import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de App Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tela Inicial',
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg_imagem1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Bem-vindo à Tela Inicial',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Aqui está o conteúdo da primeira tela',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //Montagem
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: 'Segunda Tela',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Terceira Tela',
          ),
        ],
        //Estilização
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedFontSize: 12.0,
        selectedFontSize: 16.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        //Ação
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
        },
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Segunda Tela',
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg_imagem2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo à Segunda Tela',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Aqui está o conteúdo da segunda tela',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //Montagem
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: 'Segunda Tela',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Terceira Tela',
          ),
        ],
        //Estilização
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedFontSize: 12.0,
        selectedFontSize: 16.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        //Ação
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
        },
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terceira Tela')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg_imagem3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Bem-vindo à Terceira Tela',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Aqui está o conteúdo da terceira tela',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //Montagem
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: 'Segunda Tela',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Terceira Tela',
          ),
        ],
        //Estilização
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedFontSize: 12.0,
        selectedFontSize: 16.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        //Ação
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          }
        },
      ),
    );
  }
}
