import 'package:flutter/material.dart';

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
      ),
      body: Center(
        child: Text(score.toString()),
      ),
    );
  }
}
