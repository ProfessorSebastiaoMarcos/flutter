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
      home: const MyHomePage(title: 'Consulta CEP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _cepController = TextEditingController();
  Map<String, dynamic>? _cepData; // Armazena os dados do CEP
  bool _isLoading = false; // Indica se a consulta está em andamento

  Future<void> _fetchCep() async {
    setState(() {
      // Marca a consulta como em andamento
      _isLoading = true; 
    });

    try {
      final cep = _cepController.text
          // Obtém o CEP sem traços
          .trim()
          .replaceAll('-', '');
      // Faz a consulta do CEP
      final data = await CepService.fetchCep(cep);
      setState(() {
        // Atualiza os dados do CEP
        _cepData = data;
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro'),
            // Exibe a mensagem de erro
            content: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                child: const Text('Fechar'),
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
      // Marca a consulta como finalizada
      _isLoading = false;
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
                controller:
                    // Controlador do campo de texto do CEP
                    _cepController,
                keyboardType:
                    // Apenas números são permitidos
                    TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'CEP',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                // Desativa o botão durante a consulta
                onPressed: _isLoading ? null : _fetchCep,
                child: const Text('Consultar'),
              ),
              const SizedBox(height: 16.0),
              if (_isLoading)
                // Exibe um indicador de progresso durante a consulta
                const CircularProgressIndicator()
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

