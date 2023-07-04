import 'package:flutter/material.dart';
import 'package:aula21_consumo_api_cep/data/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta CEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Consulta CEP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _cepController = TextEditingController();
  Map<String, dynamic>? _cepData; // Armazena os dados do CEP
  bool _isLoading = false; // Indica se a consulta está em andamento

  Future<void> _fetchCep() async {
    setState(() {
      _isLoading = true; // Marca a consulta como em andamento
    });

    try {
      final cep = _cepController.text.trim().replaceAll('-', ''); // Obtém o CEP sem traços
      final data = await CepService.fetchCep(cep); // Faz a consulta do CEP
      setState(() {
        _cepData = data; // Atualiza os dados do CEP
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text(e.toString()), // Exibe a mensagem de erro
            actions: <Widget>[
              TextButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    setState(() {
      _isLoading = false; // Marca a consulta como finalizada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _cepController, // Controlador do campo de texto do CEP
                keyboardType: TextInputType.number, // Apenas números são permitidos
                decoration: const InputDecoration(
                  labelText: 'CEP',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isLoading ? null : _fetchCep,
                child: const Text('Consultar'), // Desativa o botão durante a consulta
              ),
              const SizedBox(height: 16.0),
              if (_isLoading)
                const CircularProgressIndicator() // Exibe um indicador de progresso durante a consulta
              else if (_cepData != null)
                Column(
                  children: [
                    Text('Logradouro: ${_cepData!['logradouro']}'),
                    Text('Bairro: ${_cepData!['bairro']}'),
                    Text('Cidade: ${_cepData!['localidade']}'),
                    Text('Estado: ${_cepData!['uf']}'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
