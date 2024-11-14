import 'package:flutter/material.dart';
import 'teladoquiz.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo ao Quiz de Games'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(22, 33, 243, 121),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'pensa.gif',
              height: 250,
            ),
            SizedBox(height: 10),
            Text(
              'Quiz sobre games, não seja burro!!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
             SizedBox(height: 30),
            Text(
              'Teste seus conhecimentos sobre o mundo dos games!',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
              child: Text('Para de enrolar e começa o quiz'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}  