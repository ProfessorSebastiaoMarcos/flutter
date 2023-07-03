import 'package:flutter/material.dart';

///////////Tela de Serviços
class Servicos extends StatefulWidget {
  const Servicos({super.key});

  @override
  _ServicosState createState() => _ServicosState();
}

class _ServicosState extends State<Servicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tela de Serviços',
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tela de Serviços',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}