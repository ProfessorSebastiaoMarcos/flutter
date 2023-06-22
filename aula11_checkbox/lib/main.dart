import 'package:flutter/material.dart';

main() => runApp(
      const MaterialApp(
        home: CheckBoxApp(),
        debugShowCheckedModeBanner: false,
      ),
    );

class CheckBoxApp extends StatefulWidget {
  const CheckBoxApp({super.key});

  @override
  State<CheckBoxApp> createState() => _CheckBoxAppState();
}

class _CheckBoxAppState extends State<CheckBoxApp> {
  //Declerando um atributo
  bool _selecaoCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App com caixa de seleção'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Faça sua escolha'),
            Checkbox(
              value: _selecaoCheckBox,
              onChanged: (bool? valor) {
                setState(() {
                  _selecaoCheckBox = valor!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

