import 'package:flutter/material.dart';

class PickedText extends StatelessWidget {
  final String word;

  PickedText({required this.word});

  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: TextStyle(
        color: Colors.teal[600],
        fontSize: 15,
      ),
    );
  }
}
