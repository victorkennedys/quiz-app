import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/widgets/quiz%20screen%20widgets/question_text.dart';
import 'quiz_screen.dart';
import '../widgets/quiz screen widgets/question_counter.dart';
import 'package:quiz_app/constants.dart';
import '../widgets/add questions widgets/question_text_input.dart';

class AddQuestions extends StatefulWidget {
  final List questions;

  AddQuestions(this.questions);

  @override
  _AddQuestionsState createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {
  TextEditingController questionController = TextEditingController();
  TextEditingController alternative1 = TextEditingController();
  final TextEditingController alternative2 = TextEditingController();
  final TextEditingController alternative3 = TextEditingController();
  final TextEditingController alternative4 = TextEditingController();
  FocusNode myFocusNode;
  int correctAlternative;
  Icon icon1;
  Icon icon2;
  Icon icon3;
  Icon icon4;

  returnNothing() {
    return;
  }

  selectCorrectAnswer(int cardNumber) {
    setState(() {
      correctAlternative = cardNumber;
      print(correctAlternative);
      if (cardNumber == 1) {
        icon1 = Icon(Icons.check, color: Colors.blue);
        icon2 = returnNothing();
        icon3 = returnNothing();
        icon4 = returnNothing();
      }
      if (cardNumber == 2) {
        icon2 = Icon(Icons.check, color: Colors.blue);
        icon1 = returnNothing();
        icon3 = returnNothing();
        icon4 = returnNothing();
      }
      if (cardNumber == 3) {
        icon3 = Icon(
          Icons.check,
          color: Colors.blue,
        );
        icon1 = returnNothing();
        icon2 = returnNothing();
        icon4 = returnNothing();
      }
      if (cardNumber == 4) {
        icon4 = Icon(
          Icons.check,
          color: Colors.blue,
        );
        icon1 = returnNothing();
        icon2 = returnNothing();
        icon3 = returnNothing();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ]),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      child: Column(
                        children: [
                          QuestionTextInput(questionController),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Divider(
                              height: 20,
                              color: Colors.grey[350],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Alternative("Alternative 1", alternative1,
                              selectCorrectAnswer, 1, icon1),
                          Alternative("Alternative 2", alternative2,
                              selectCorrectAnswer, 2, icon2),
                          Alternative("Alternative 3", alternative3,
                              selectCorrectAnswer, 3, icon3),
                          Alternative("Alternative 4", alternative4,
                              selectCorrectAnswer, 4, icon4),
                          TextButton(
                            child: Text('Add question'),
                            onPressed: () {
                              questions.add(
                                {
                                  'questionText': '${questionController.text}',
                                  "alternatives": [
                                    '${alternative1.text}',
                                    '${alternative2.text}',
                                    '${alternative3.text}',
                                    '${alternative4.text}'
                                  ],
                                  "correctIndex": correctAlternative,
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Alternative extends StatelessWidget {
  final String alternativeNumber;
  final TextEditingController alternativeController;
  final Function selectCorrectCard;
  final int cardNumber;
  final Icon icon;

  Alternative(this.alternativeNumber, this.alternativeController,
      this.selectCorrectCard, this.cardNumber, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Card(
        elevation: 1,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Container(
                      width: 100,
                      child: Text(
                        "$alternativeNumber",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: kDefaultPadding,
                        left: kDefaultPadding,
                        bottom: kDefaultPadding),
                    child: TextField(
                      controller: alternativeController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print(cardNumber);
                  selectCorrectCard(cardNumber);
                },
                child: Container(
                  child: icon,
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
