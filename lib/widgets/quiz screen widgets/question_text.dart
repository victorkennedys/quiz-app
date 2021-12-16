import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class QuestionText extends StatelessWidget {
  final String questionText;

  QuestionText(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      child: Text(
        questionText,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
