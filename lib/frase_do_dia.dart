import 'package:flutter/material.dart';
import 'dart:math';

class Frase extends StatefulWidget {
  @override
  State<Frase> createState() => _FraseState();
}

class _FraseState extends State<Frase> {
  var _frases = [
    "nada pode ser tão ruim que não possa piorar!",
    "É errando que se aduba a vida",
    "Para baixo todo Santo ajuda!",
    "O caminho é logo, mas a derrota é certa!",
    "Vamos esquecer nos erros do passado, e vamos focar nos erros de agora!",
    "Calma, que é aos poucos que a vida vai dando errado!",
    "Na hora certa tudo vai dar errado",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase";

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Frase do Dia",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset('images/frase_do_dia/logo.png'),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: _gerarFrase,
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
