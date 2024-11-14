import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetQuiz;

  Result(this.score, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    String resultText;
    String imageUrl;

    if (score <= 5) {
      resultText = "Infelizmente, você não sabe muito sobre games!";
      imageUrl = 'assets/gemido.gif'; 
    } else if (score <= 8) {
      resultText = "Você até que sabe um pouco sobre games!";
      imageUrl = 'assets/davymaiado.gif'; 
    } else {
      resultText = "Você recebeu o prêmio Davy Jones dos games!";
      imageUrl = 'assets/davy-jones.gif';
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultText,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Image.network(
            imageUrl,
            height: 250,
          ),
          SizedBox(height: 20),
          Text(
            'Pontuação final: $score',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetQuiz,
            child: Text('Reiniciar Quiz'),
          ),
        ],
      ),
    );
  }
}
