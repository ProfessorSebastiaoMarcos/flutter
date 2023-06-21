import 'package:flutter/material.dart';

main() => runApp(const ImagemApp());

class ImagemApp extends StatelessWidget {
  const ImagemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trabalhando com imagens',
      home: Container(
        margin: const EdgeInsets.only(top: 60),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.amber,
          ),
        ),
        child: Image.asset(
          'images/passeio.jpg',
          fit: BoxFit.contain,
        ),
      ),
    );

    //Definição de preenchimento da imagem

    /*
    fit: BoxFit.cover
    Cobre todo o espaçamento cortanto a imagem    
    
    fit: BoxFit.contain
    Valor padrão

    fit: BoxFit.fill
    Preenche com distorção

    fit: BoxFit.fitHeight
    preencher pela altura (Largura na proporção)
    
    fit: BoxFit.fitWidth
    preencher pela largura (altura na proporção)

    fit: BoxFit.none
    Mantem a imagem original
    */
  }
}
