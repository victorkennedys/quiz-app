import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final Function checkAnswer;
  final Color buttonColor;
  final Function setColor;
  final Icon buttonIcon;
  final option;
  final int optionIndex;
  final List userAnswers;
  final int questionIndex;
  final Function nextButton;

  Options(
      this.checkAnswer,
      this.buttonColor,
      this.setColor,
      this.buttonIcon,
      this.option,
      this.optionIndex,
      this.userAnswers,
      this.questionIndex,
      this.nextButton);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        checkAnswer(
          optionIndex,
        );
        setColor(optionIndex);
        await Future.delayed(Duration(seconds: 1), () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ModalContent(userAnswers, questionIndex, nextButton);
            },
          );
        });
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
                  option,
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

class ModalContent extends StatelessWidget {
  final List userAnswers;
  final int questionIndex;
  final Function nextButton;

  ModalContent(this.userAnswers, this.questionIndex, this.nextButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          userAnswers[questionIndex] == true
              ? Column(
                  children: [
                    Text(
                      '😁',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      'Good job',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    TextButton(
                        child: Text('Next question'),
                        onPressed: () {
                          nextButton();
                          Navigator.pop(context);
                        }),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      "😢",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      'Incorrect...',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    TextButton(
                        child: Text('Next question'),
                        onPressed: () {
                          nextButton();
                          Navigator.pop(context);
                        }),
                  ],
                ),
        ],
      ),
    );
  }
}
