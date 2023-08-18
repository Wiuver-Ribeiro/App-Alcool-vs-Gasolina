import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  // Home({Key key}) : super(key:  key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController alcoolController = TextEditingController();
  final TextEditingController gasolinaController = TextEditingController();
  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Alcool vs Gasolina"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              width: 180,
              height: 180,
              child: Image(image: AssetImage("images/bomba.png")),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                controller: alcoolController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Valor do Alcool",
                    prefix: Text("R\$ "),
                    labelStyle: TextStyle(color: Colors.blue)),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                controller: gasolinaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Valor do Gasolina",
                    prefix: Text("R\$ "),
                    labelStyle: TextStyle(color: Colors.blue)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                onPressed: () {
                  double valorAlcool = double.parse(alcoolController.text);
                  double valorGasolina = double.parse(gasolinaController.text);

                  double relacao = valorAlcool / valorGasolina;
                  print(relacao);

                  setState(() {
                    if (relacao < 0.7) {
                      _resultado = 'Abasteça com Álcool';
                    } else {
                      _resultado = 'Abasteça com Gasolina';
                    }
                  });
                },
                child: const Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                '$_resultado',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.lightBlueAccent,
                  ),
              ),
            ),
          ],
        )));
  }
}
