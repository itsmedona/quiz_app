import 'package:flutter/material.dart';
import 'package:quiz_app/view/HomePage/HomePage.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.score});
  final int score;

  // int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QwizB"),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 10,
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Score: $score",
              style: const TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.w500,
                  fontSize: 35),
            ),
            SizedBox(
              height: 250,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Text("Try Again"),
            )
          ],
        )),
      ),
    );
  }
}
