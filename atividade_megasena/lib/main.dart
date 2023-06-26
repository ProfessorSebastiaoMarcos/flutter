import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(
      const MaterialApp(
        home: MegaSenaApp(),
        debugShowCheckedModeBanner: false,
      ),
    );

class MegaSenaApp extends StatefulWidget {
  const MegaSenaApp({super.key});

  @override
  State<MegaSenaApp> createState() => _MegaSenaAppState();
}

class _MegaSenaAppState extends State<MegaSenaApp> {
  //Lógica
  String _resposta = '';

  void sorteioMega() {
    setState(() {
      // declarando a variavel random
      Random random = Random();

      int aux = 0;
      int i = 1;

      // criação de lista
      List<int> listaNumeros = [];

      // adicionando 6 numeros aleatoreos
      for (i = 1; i <= 6; i++) {
        int numeroRandom = random.nextInt(60) + 1;

        // verificar se o numero nao tiver na lista
        if (!(listaNumeros.contains(numeroRandom))) {
          // Adicionando os numeros na lista
          listaNumeros.add(numeroRandom);

          aux = aux + 1;
        }
        // if para a pegar os numeros pulados
        if (i == 6) {
          i = aux;
        }
        //Ordenando os números
        listaNumeros.sort();
      }
      // retornando a lista

      _resposta = listaNumeros.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Titulo
        title: const Text('App Sorteio MegaSena'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        // Adicionando a borda
        decoration: BoxDecoration(
          // borda do container
          border: Border.all(
            color: Colors.lightGreen.shade600,
            width: 20,
          ),
        ),

        child: Column(
          children: [
            // Logo mega sena
            Padding(
              padding: const EdgeInsets.only(
                top: 100,
                left: 12,
                right: 12,
              ),
              child: Image.asset(
                'images/logo.png',
                scale: 2,
              ),
            ),

            // Numeros sorteados
            Padding(
              padding: const EdgeInsets.only(
                top: 110,
              ),
              child: Text(
                _resposta,
                style: TextStyle(
                  fontSize: 29,
                  color: Colors.yellow.shade600,
                ),
              ),
            ),

            // Botao Sortear
            Padding(
              padding: const EdgeInsets.only(
                top: 93,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                ),
                onPressed: sorteioMega,
                child: const Text(
                  'Sortear',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação do botão flutuante
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Ação do ícone de home
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Ação do ícone de pesquisa
              },
            ),
            const SizedBox(
              width: 48.0,
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Ação do ícone de notificações
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu),
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
