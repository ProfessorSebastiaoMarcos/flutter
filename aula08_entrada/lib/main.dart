//Entrada de dados
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() => runApp(
      const MaterialApp(
        home: Entradas(),
      ),
    );

class Entradas extends StatefulWidget {
  const Entradas({super.key});

  @override
  _EntradasState createState() => _EntradasState();
}

class _EntradasState extends State<Entradas> {
  //Iniciando um controlador
  final TextEditingController _textEditingController = TextEditingController();

  //Variável para saída
  String _resposta = 'Resultado';

  void recuperarValor() {
    setState(() {
      _resposta = _textEditingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada de dados'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),

            //Entrada (input)
            child: TextField(
              //TextInputType.text, .number, .emailAdress
              keyboardType: TextInputType.text,

              //Informação para o o usuário
              decoration: const InputDecoration(
                labelText: 'Digite alguma coisa',
              ),
              //Habilitando e desabilitando um campo
              enabled: true,

              //Tamanho máximo do campos
              maxLength: 5,

              //Controlador do maxLength
              //enforced: Não deixa passar da quantidade de dígitos
              //pré-determinada
              //none: libera a digitação com aviso visual
              maxLengthEnforcement: MaxLengthEnforcement.none,

              //Estilizando o texto
              style: const TextStyle(
                fontSize: 20,
                color: Colors.redAccent,
              ),

              //Escondendo o texto (password)
              obscureText: false, //True / false

              //Pegar o valor
              controller: _textEditingController,
            ),
          ),
          ElevatedButton(
            onPressed: recuperarValor,
            child: const Text(
              'Salvar',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              _resposta,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
              ),
            ),
          )
        ],
      ),
    );
  }
}

