import 'package:flutter/material.dart';

main() => runApp(
      const MaterialApp(
        home: Home(),
      ),
    );

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Home'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Servicos(
                      nome: 'Mecânico',
                      endereco: 'Rua Santo Antônio, 15',
                      contato: '(32)99196-8008',
                    ),
                  ),
                );
              },
              child: const Text(
                'Ir para serviços',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Contato(),
                  ),
                );
              },
              child: const Text(
                'Ir para contatos',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Tela de Serviços
class Servicos extends StatefulWidget {
  //Atributos
  final String? nome;
  final String? endereco;
  final String? contato;

  //Construtor
  const Servicos({super.key, this.nome, this.endereco, this.contato});

  @override
  State<Servicos> createState() => _ServicosState();
}

//Serviços
class _ServicosState extends State<Servicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Serviços'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              const Text(
                'Tela de Serviços',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('Profissional: ${widget.nome}'),
                    Text('Endereço: ${widget.endereco}'),
                    Text('Contato: : ${widget.contato}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////Contato
class Contato extends StatefulWidget {
  const Contato({super.key});

  @override
  State<Contato> createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Voltar para Home',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

