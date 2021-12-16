import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class QuestionTextInput extends StatelessWidget {
  final TextEditingController questionController;
  QuestionTextInput(this.questionController);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: kDefaultPadding, top: kDefaultPadding),
          child: Text(
            "Question Text",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: TextField(
            controller: questionController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
