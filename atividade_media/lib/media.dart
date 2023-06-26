import 'package:flutter/material.dart';

class MediaNotas extends StatefulWidget {
  const MediaNotas({super.key});

  @override
  _MediaNotasState createState() => _MediaNotasState();
}

class _MediaNotasState extends State<MediaNotas> {
  //INSTÂNCIAS DO CONTROLADOR
  TextEditingController valor1 = TextEditingController();
  TextEditingController valor2 = TextEditingController();
  String _resultado = '';

  //FUNÇÃO PARA O BOTÃO CALCULAR
  void _calcularMedia() {
    //Atenção com NULLSAFE
    //tryParse: Vai fazer cast e retornar null se não encontrar
    double? nota1 = double.tryParse(valor1.text);
    double? nota2 = double.tryParse(valor2.text);

    if (nota1 == null || nota2 == null) {
      setState(() {
        _resultado = 'Valor inválido!';
      });
    } else {
      //Cálculo da Média
      double media = (nota1 + nota2) / 2;

      setState(() {
        //Limpo os campos
        valor1 = TextEditingController(text: '');
        valor2 = TextEditingController(text: '');
        //Passo o resultado com duas casas decimais
        _resultado = media.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Média'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        //CRIA UMA COLUNA COM UM SCROLL
        child: SingleChildScrollView(
          child: Column(
            //ESTICANDO OS CONTEÚDOS
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'images/logo.png',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 5,
                ),
                child: Text(
                  'Preencha os campos abaixo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Informe o primeiro valor',
                  ),

                  //Captura o valor do campo
                  controller: valor1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Informe o segundo valor',
                  ),

                  //Captura o valor do campo
                  controller: valor2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 20,
                  left: 20,
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                    onPressed: _calcularMedia,
                    child: const Text(
                      'Calcular',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Resultado: $_resultado',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
