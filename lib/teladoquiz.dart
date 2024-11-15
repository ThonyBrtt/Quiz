import 'package:flutter/material.dart';
import 'dart:async'; 
import 'telaresultado.dart'; 

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _score = 0;
  int _timer = 10;  
  Timer? _timerController;

      final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Qual é o nome do personagem principal de "The Legend of Zelda?"',
      'imageUrl': 'link.gif',  
      'answers': [
        {'text': 'Zelda', 'score': 0},
        {'text': 'Link', 'score': 1},
        {'text': 'Ganondorf', 'score': 0},
        {'text': 'Epona', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual jogo é famoso por ter roubado o prêmio de Read Dead 2?',
      'imageUrl': 'm.gif',  
      'answers': [
        {'text': 'God Of War', 'score': 1},
        {'text': 'War of God', 'score': 0},
        {'text': 'Bom de Guerra', 'score': 0},
        {'text': 'Guerra de Bom', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual desses jogos não é de futebol?',
      'imageUrl': 'xd.gif',  
      'answers': [
        {'text': 'Fifa', 'score': 0},
        {'text': 'Futebol', 'score': 0},
        {'text': 'Ea Fc', 'score': 0},
        {'text': 'Todas as opções', 'score': 1},
      ],
    },
    {
      'questionText': 'Qual dessas é a pior empresa?',
      'imageUrl': 'vish.gif',  
      'answers': [
        {'text': 'Activision', 'score': 0},
        {'text': 'Epic Games', 'score': 0},
        {'text': 'Ubisoft', 'score': 1},
        {'text': 'Square Enix', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual desses jogos tem o protagonista Artur Morgan?',
      'imageUrl': 'arthur.gif',  
      'answers': [
        {'text': 'Red Dead 2', 'score': 1},
        {'text': 'Red Dead 1', 'score': 0},
        {'text': 'God Of War', 'score': 0},
        {'text': 'Resident Evil 4', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual o nome do jogo que você sobrevive em uma pizzaria?',
      'imageUrl': 'pizza.gif',  
      'answers': [
        {'text': 'Outlast', 'score': 0},
        {'text': 'Five Nights at Freddy\'s', 'score': 1},
        {'text': 'Silent Hill', 'score': 0},
        {'text': 'Resident Evil', 'score': 0},
      ],
    },
    {
      'questionText': 'Em qual desses jogos você encontra o personagem "Petches"?',
      'imageUrl': 'opaaa.gif',  
      'answers': [
        {'text': 'The Witcher', 'score': 0},
        {'text': 'Dark Souls', 'score': 1},
        {'text': 'Assassin\'s Creed', 'score': 0},
        {'text': 'Skyrim', 'score': 0},
      ],
    },
    {
      'questionText': 'Em qual jogo se encontra esse boss?',
      'imageUrl': 'elden.png', 
      'answers': [
        {'text': 'Elden Ring', 'score': 1},
        {'text': 'Vampire Survivors', 'score': 0},
        {'text': 'The Witcher', 'score': 0},
        {'text': 'Final Fantasy', 'score': 0},
      ],
    },
    {
      'questionText': 'Na imagem acima, isso é...',
      'imageUrl': 'loja.png',  
      'answers': [
        {'text': 'Safadesas', 'score': 0},
        {'text': 'Missão Aleatória', 'score': 0},
        {'text': 'Loja de Sapatos', 'score': 1},
      ],
    },
    {
      'questionText': 'Qual é o nome do criador de "Super Mario"?',
      'imageUrl': 'mario.gif',  
      'answers': [
        {'text': 'Hideo Kojima', 'score': 0},
        {'text': 'Shigeru Miyamoto', 'score': 1},
        {'text': 'Satoru Iwata', 'score': 0},
        {'text': 'Masahiro Sakurai', 'score': 0},
      ],
    },
    {
      'questionText': 'Esse personagem se encontra em qual jogo?',
      'imageUrl': 'ghost2.gif',  
      'answers': [
        {'text': 'Halo', 'score': 0},
        {'text': 'Call of Duty', 'score': 1},
        {'text': 'Gears of War', 'score': 0},
        {'text': 'Destiny', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual é o nome do mundo de "Final Fantasy VII"?',
      'imageUrl': 'final2.gif', 
      'answers': [
        {'text': 'Hyrule', 'score': 0},
        {'text': 'Spira', 'score': 0},
        {'text': 'Ivalice', 'score': 0},
        {'text': 'Gaia', 'score': 1},
      ],
    },
    {
      'questionText': 'Qual o vilão principal do jogo "Batman: Arkham Asylum"?',
      'imageUrl': 'batman2.gif',  
      'answers': [
        {'text': 'Bane', 'score': 0},
        {'text': 'Two-Face', 'score': 0},
        {'text': 'Joker', 'score': 1},
        {'text': 'Riddler', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual é o nome da principal personagem de "Tomb Raider"?',
      'imageUrl': 'lara.gif',  
      'answers': [
        {'text': 'Lara Croft', 'score': 1},
        {'text': 'Aloy', 'score': 0},
        {'text': 'Chloe Frazer', 'score': 0},
        {'text': 'Ellie', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual desses jogos ganhou o prêmio de Melhor Jogo do Ano de 2020?',
      'imageUrl': 'game.png', 
      'answers': [
        {'text': 'Hades', 'score': 0},
        {'text': 'Ghost of Tsushima', 'score': 0},
        {'text': 'Final Fantasy VII Remake', 'score': 0},
        {'text': 'The Last of Us Part 2', 'score': 1},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _startTimer(); // Inicia o temporizador ao carregar o quiz
  }

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _questionIndex++;
      _timer = 10; // Reseta o timer para a próxima questão
    });
    _startTimer(); // Reinicia o temporizador para a próxima questão
  }

  void _goBack() {
    if (_questionIndex > 0) {
      setState(() {
        _questionIndex--;
        _timer = 10; // Reseta o timer ao voltar para a pergunta anterior
      });
      _startTimer(); // Reinicia o temporizador ao voltar para a pergunta anterior
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
      _timer = 10; // Reseta o timer ao reiniciar o quiz
    });
    _startTimer(); // Reinicia o temporizador ao reiniciar o quiz
  }

  void _startTimer() {
    if (_timerController != null) {
      _timerController!.cancel(); // Cancela o temporizador anterior, se houver
    }

    _timerController = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timer > 0) {
          _timer--;
        } else {
          timer.cancel();
          _answerQuestion(0); // Chama a próxima pergunta quando o tempo acaba
        }
      });
    });
  }

  void _goToHome() {
    Navigator.pop(context);  
  }

  @override
  void dispose() {
    _timerController?.cancel(); // Cancela o temporizador quando a tela for descartada
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Games'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _questionIndex < _questions.length
            ? Quiz(
                question: _questions[_questionIndex]['questionText'] as String,
                answers: _questions[_questionIndex]['answers'] as List<Map<String, Object>>?,
                answerQuestion: _answerQuestion,
                goBack: _goBack, 
                imageUrl: _questions[_questionIndex]['imageUrl'] as String,
                questionIndex: _questionIndex, 
                timer: _timer, 
                goToHome: _goToHome,  
              )
            : Result(_score, _resetQuiz),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  final String question;
  final List<Map<String, Object>>? answers;
  final Function answerQuestion;
  final Function goBack;
  final String imageUrl;
  final int questionIndex;
  final int timer; 
  final Function goToHome; 

  Quiz({
    required this.question,
    required this.answers,
    required this.answerQuestion,
    required this.goBack,
    required this.imageUrl,
    required this.questionIndex,
    required this.timer,
    required this.goToHome, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tempo restante: $timer s',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 20),
        if (imageUrl.isNotEmpty)
          Image.asset(
            imageUrl,
            height: 380,
            fit: BoxFit.cover,
          ),
        SizedBox(height: 20),
        Text(
          question,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: answers!
              .map((answer) => ElevatedButton(
                    onPressed: () => answerQuestion(answer['score'] as int),
                    child: Text(
                      answer['text'] as String,
                      style: TextStyle(fontWeight: FontWeight.bold),  
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: 20),

        if (questionIndex > 0)
          ElevatedButton(
            onPressed: () => goBack(),
            child: Text('Voltar para a pergunta anterior'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        if (questionIndex == 0)
          ElevatedButton(
            onPressed: () => goToHome(),
            child: Text('Voltar para a Tela Inicial'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
      ],
    );
  }
}
