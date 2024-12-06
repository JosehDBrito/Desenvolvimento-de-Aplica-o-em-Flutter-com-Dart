import 'package:flutter/material.dart';
import 'dart:math';

class JogoDaMemoria extends StatefulWidget {
  const JogoDaMemoria({super.key});

  @override
  JogoDaMemoriaState createState() => JogoDaMemoriaState();
}

class JogoDaMemoriaState extends State<JogoDaMemoria> {
  final List<String> _cardImages = [
    'images/jogo_da_memoria/imagem1.png',
    'images/jogo_da_memoria/imagem2.png',
    'images/jogo_da_memoria/imagem3.png',
    'images/jogo_da_memoria/imagem4.png',
    'images/jogo_da_memoria/imagem1.png',
    'images/jogo_da_memoria/imagem2.png',
    'images/jogo_da_memoria/imagem3.png',
    'images/jogo_da_memoria/imagem4.png',
  ];

  late List<bool> _cardFlipped;
  late List<String> _shuffledCards;
  int? _firstCardIndex;
  int? _secondCardIndex;
  int _matchedPairs = 0;

  @override
  void initState() {
    super.initState();
    _cardFlipped = List.generate(_cardImages.length, (index) => false);
    _shuffledCards = List.from(_cardImages);
    _shuffledCards.shuffle(Random());
  }

  void _flipCard(int index) {
    if (_cardFlipped[index] || _firstCardIndex == index) return;

    setState(() {
      _cardFlipped[index] = true;

      if (_firstCardIndex == null) {
        _firstCardIndex = index;
      } else {
        _secondCardIndex = index;

        if (_shuffledCards[_firstCardIndex!] ==
            _shuffledCards[_secondCardIndex!]) {
          _matchedPairs++;
          _firstCardIndex = null;
          _secondCardIndex = null;
        } else {
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _cardFlipped[_firstCardIndex!] = false;
              _cardFlipped[_secondCardIndex!] = false;
              _firstCardIndex = null;
              _secondCardIndex = null;
            });
          });
        }
      }

      if (_matchedPairs == _cardImages.length ~/ 2) {
        _showGameOverDialog();
      }
    });
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Parabéns!"),
          content: const Text("Você encontrou todos os pares!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
              child: const Text("Jogar Novamente"),
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      _matchedPairs = 0;
      _cardFlipped = List.generate(_cardImages.length, (index) => false);
      _shuffledCards.shuffle(Random());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "Jogo da Memoria",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.red,
        toolbarHeight: 70,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _shuffledCards.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _flipCard(index),
            child: Card(
              child: Center(
                child: _cardFlipped[index]
                    ? Image.asset(
                        _shuffledCards[index],
                        fit: BoxFit.cover,
                      )
                    : const Text(
                        '?',
                        style: TextStyle(fontSize: 24),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
