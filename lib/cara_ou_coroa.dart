import 'package:flutter/material.dart';
import 'dart:math';

class CaraOuCoroa extends StatefulWidget {
  @override
  _CaraOuCoroaState createState() => _CaraOuCoroaState();
}

class _CaraOuCoroaState extends State<CaraOuCoroa> {
  String appChoice = '';
  String resultMessage = '';
  String appImage = 'images/cara_ou_coroa/padrao.gif';

  void playGame(String choice) {
    List<String> options = ['Cara', 'Coroa'];
    appChoice = options[Random().nextInt(options.length)];

    switch (appChoice) {
      case 'Cara':
        appImage = 'images/cara_ou_coroa/cara.png';
        break;
      case 'Coroa':
        appImage = 'images/cara_ou_coroa/coroa.png';
        break;
    }

    if (choice == appChoice) {
      resultMessage = 'Você ganhou!';
    } else {
      resultMessage = 'Você perdeu!';
    }

    setState(() {});

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        appImage = 'images/cara_ou_coroa/padrao.gif';
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
          "Cara ou Coroa",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Resultado: $appChoice",
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
                onTap: () => playGame('Cara'),
                child: Image.asset("images/cara_ou_coroa/cara.png"),
              ),
              GestureDetector(
                onTap: () => playGame('Coroa'),
                child: Image.asset("images/cara_ou_coroa/coroa.png"),
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
