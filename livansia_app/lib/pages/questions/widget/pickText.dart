import 'package:flutter/material.dart';

class PickedText extends StatelessWidget {
  final String word;
  final int countTextVal;

  PickedText({required this.word, required this.countTextVal});

  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: TextStyle(
        color: countTextVal == 0 ? Colors.grey : Colors.teal[600],
        fontSize: 15,
      ),
    );
  }
}
