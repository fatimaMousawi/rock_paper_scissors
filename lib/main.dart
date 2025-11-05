import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Paper Scissors',
      home: RockPaperScissorsGame(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RockPaperScissorsGame extends StatefulWidget {
  @override
  _RockPaperScissorsGameState createState() => _RockPaperScissorsGameState();
}

class _RockPaperScissorsGameState extends State<RockPaperScissorsGame> {
  String playerChoice = '❓';
  String computerChoice = '❓';
  String message = '';
  int playerScore = 0;
  int computerScore = 0;

  final List<String> emojis = ['✊', '✌️', '🖐️']; // Rock, Scissors, Paper

  void playGame(String playerMove) {
    String compMove = emojis[Random().nextInt(3)];

    setState(() {
      playerChoice = playerMove;
      computerChoice = compMove;

      if (playerMove == compMove) {
        message = 'It is a Tie 😐';
      } else if ((playerMove == '✊' && compMove == '✌️') ||
          (playerMove == '✌️' && compMove == '🖐️') ||
          (playerMove == '🖐️' && compMove == '✊')) {
        message = 'You Win 😄';
        playerScore++;
      } else {
        message = 'You Lose 😢';
        computerScore++;
      }
    });
  }

  void resetGame() {
    setState(() {
      playerChoice = '❓';
      computerChoice = '❓';
      message = '';
      playerScore = 0;
      computerScore = 0;
    });
  }

  Widget actionButton(String imageName, String moveEmoji) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => playGame(moveEmoji),
        child: Image.asset('assets/images/$imageName', width: 70),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Let's Play Rock-Paper-Scissors",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text('You: $playerChoice', style: TextStyle(fontSize: 26)),
            Text('Computer: $computerChoice', style: TextStyle(fontSize: 26)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                actionButton('rock.png', '✊'),
                actionButton('scissors.png', '✌️'),
                actionButton('paper.png', '🖐️'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your Score: $playerScore    Computer Score: $computerScore',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 10),
            IconButton(
              icon: Icon(Icons.refresh, color: Colors.red, size: 30),
              onPressed: resetGame,
            ),
          ],
        ),
      ),
    );
  }
}
