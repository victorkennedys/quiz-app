import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final List questions;
  final int questionIndex;
  final int alternativeIndex;
  final Function checkAnswer;
  final Color buttonColor;
  final Function setColor;
  final Icon buttonIcon;

  Options(this.questions, this.questionIndex, this.alternativeIndex,
      this.checkAnswer, this.buttonColor, this.setColor, this.buttonIcon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        checkAnswer(
          questions[questionIndex]["alternatives"][alternativeIndex],
        );
        setColor(questions[questionIndex]["alternatives"][alternativeIndex]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: buttonColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  questions[questionIndex]["alternatives"][alternativeIndex],
                  style: TextStyle(color: buttonColor, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  child: buttonIcon,
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: buttonColor),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
