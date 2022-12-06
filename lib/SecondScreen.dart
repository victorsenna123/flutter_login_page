import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "route",
      home: Scaffold(
        appBar: AppBar(title: Text("Bem vindo Victor"),),
        body: Center(
          child: ElevatedButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            child: Text("retorne a pagina de login"),
          )
        ),
      ),
    );
  }
}