import 'package:flutter/material.dart';
// Importação da biblioteca http para fazer solicitações HTTP
import 'package:http/http.dart' as http;
// Importação da biblioteca para trabalhar com JSON
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cotação de Moedas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cotação de Moedas'),
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
  // Variável para armazenar o valor do dólar
  double? _dollarValue;
  // Variável para armazenar o valor do euro
  double? _euroValue;

  Future<void> _fetchCurrencyData() async {
    final url = Uri.parse(
        // URL da API para obter os dados de cotação
        'https://api.coinbase.com/v2/exchange-rates?currency=BRL');
    // Faz a solicitação GET para a API
    final response = await http.get(url);
// Verifica se a resposta da API foi bem-sucedida
    if (response.statusCode == 200) {
      // Converte a resposta JSON em um objeto Dart
      final data = jsonDecode(response.body);

      setState(() {
        // Obtém o valor do dólar a partir dos dados da API
        _dollarValue = double.parse(data['data']['rates']['USD']);
        // Obtém o valor do euro a partir dos dados da API
        _euroValue = double.parse(data['data']['rates']['EUR']);
      });
    } else {
      // Caso a resposta da API não seja bem-sucedida
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('Falha ao obter os dados da API.'),
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
  }

  @override
  void initState() {
    super.initState();
    // Chama a função para obter os dados de cotação ao iniciar o aplicativo
    _fetchCurrencyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // Exibe o valor do dólar na interface do usuário
              'Valor do Dólar: ${_dollarValue != null ? _dollarValue.toString() : 'Carregando...'}',
            ),
            const SizedBox(height: 16.0),
            Text(
              // Exibe o valor do euro na interface do usuário
              'Valor do Euro: ${_euroValue != null ? _euroValue.toString() : 'Carregando...'}',
            ),
          ],
        ),
      ),
    );
  }
}
