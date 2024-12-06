import 'package:flutter/material.dart';
import 'dart:math';

class Jokenpo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jokenpo> {
  String appChoice = '';
  String userChoice = '';
  String resultMessage = '';
  String appImage = 'images/jokenpo/padrao.png';

  void playGame(String choice) {
    userChoice = choice;

    List<String> options = ['Pedra', 'Papel', 'Tesoura'];
    appChoice = options[Random().nextInt(options.length)];

    switch (appChoice) {
      case 'Pedra':
        appImage = 'images/jokenpo/pedra.png';
        break;
      case 'Papel':
        appImage = 'images/jokenpo/papel.png';
        break;
      case 'Tesoura':
        appImage = 'images/jokenpo/tesoura.png';
        break;
    }

    if (userChoice == appChoice) {
      resultMessage = 'Empate!';
    } else if ((userChoice == 'Pedra' && appChoice == 'Tesoura') ||
        (userChoice == 'Papel' && appChoice == 'Pedra') ||
        (userChoice == 'Tesoura' && appChoice == 'Papel')) {
      resultMessage = 'Você ganhou!';
    } else {
      resultMessage = 'Você perdeu!';
    }

    setState(() {});

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        appImage = 'images/jokenpo/padrao.png';
        appChoice = '';
        resultMessage = '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JokenPo",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App: $appChoice",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(appImage),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opção abaixo",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => playGame('Pedra'),
                child: Image.asset("images/jokenpo/pedra.png"),
              ),
              GestureDetector(
                onTap: () => playGame('Papel'),
                child: Image.asset("images/jokenpo/papel.png"),
              ),
              GestureDetector(
                onTap: () => playGame('Tesoura'),
                child: Image.asset("images/jokenpo/tesoura.png"),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            resultMessage,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
