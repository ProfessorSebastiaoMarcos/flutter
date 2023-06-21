import 'package:flutter/material.dart';

main() => runApp(
      const MaterialApp(
        home: AppDinamico(),
      ),
    );

class AppDinamico extends StatefulWidget {
  const AppDinamico({super.key});

  @override
  State<AppDinamico> createState() => _AppDinamicoState();
}

class _AppDinamicoState extends State<AppDinamico> {
  //Lógica
  String _nome = 'John Doe';
  final String _titulo = 'Meu App Statful';
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        //Centralizar o conteúdo
        child: Center(
          child: Column(
            //alinhamento principal
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_nome),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _nome = 'Jane Doe';
                  });
                  print(
                    'Funcionando: ${_nome}',
                  );
                },
                child: const Text('Clique aqui para alterar o nome'),
              )
            ],
          ),
        ),
      ),
    );
  }
}


