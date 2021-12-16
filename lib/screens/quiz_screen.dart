import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import '../widgets/quiz screen widgets/options.dart';
import '../widgets/quiz screen widgets/question_text.dart';
import '../widgets/quiz screen widgets/question_counter.dart';
import 'add_questions.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

int points = 0;
int questionIndex = 0;
Color buttonColor1 = Colors.grey;
Color buttonColor2 = Colors.grey;
Color buttonColor3 = Colors.grey;
Color buttonColor4 = Colors.grey;
Widget button1Icon;
Widget button2Icon;
Widget button3Icon;
Widget button4Icon;
returnNothing() {
  return;
}

List questions = [
  {
    'questionText':
        'Which theory moves away from individual to social and environmental explanations of crime?',
    "alternatives": [
      'Left realism',
      'Right realism',
      'Chicago school',
      'Critical criminology'
    ],
    'correctIndex': 3,
  },
];

List<bool> userAnswers = [];

class _QuizScreenState extends State<QuizScreen> {
  List<String> alternatives = questions[questionIndex]['alternatives'];
  int correctAnswer = questions[questionIndex]['correctIndex'];

  void checkAnswer(int userAnswer) {
    userAnswer == correctAnswer
        ? {points = points + 1, userAnswers.add(true)}
        : {points = points, userAnswers.add(false)};
  }

  void setColor(int userAnswer) {
    setState(() {
      if (userAnswer == correctAnswer) {
        if (userAnswer == 1) {
          buttonColor1 = Colors.green;
          button1Icon = Icon(
            Icons.check,
            color: buttonColor1,
          );
        }
        if (userAnswer == 2) {
          buttonColor2 = Colors.green;
          button2Icon = Icon(
            Icons.check,
            color: buttonColor2,
          );
        }
        if (userAnswer == 3) {
          buttonColor3 = Colors.green;
          button3Icon = Icon(
            Icons.check,
            color: buttonColor3,
          );
        }
        if (userAnswer == 4) {
          buttonColor4 = Colors.green;
          button4Icon = Icon(
            Icons.check,
            color: buttonColor4,
          );
        }
      }
      if (userAnswer != correctAnswer) {
        if (userAnswer == 1) {
          buttonColor1 = Colors.red;
          button1Icon = Icon(
            Icons.close,
            color: buttonColor1,
          );
          if (correctAnswer == 2) {
            buttonColor2 = Colors.green;
          }
          if (correctAnswer == 3) {
            buttonColor3 = Colors.green;
          }
          if (correctAnswer == 4) {
            buttonColor4 = Colors.green;
          }
        }

        if (userAnswer == 2) {
          buttonColor2 = Colors.red;
          button2Icon = Icon(
            Icons.close,
            color: buttonColor2,
          );
          if (correctAnswer == 1) {
            buttonColor1 = Colors.green;
          }
          if (correctAnswer == 3) {
            buttonColor3 = Colors.green;
          }
          if (correctAnswer == 4) {
            buttonColor4 = Colors.green;
          }
        }

        if (userAnswer == 3) {
          buttonColor3 = Colors.red;
          button3Icon = Icon(
            Icons.close,
            color: buttonColor3,
          );
          if (correctAnswer == 1) {
            buttonColor1 = Colors.green;
          }
          if (correctAnswer == 2) {
            buttonColor2 = Colors.green;
          }
          if (correctAnswer == 4) {
            buttonColor4 = Colors.green;
          }
        }

        if (userAnswer == 4) {
          buttonColor4 = Colors.red;
          button4Icon = Icon(
            Icons.close,
            color: buttonColor4,
          );
          if (correctAnswer == 1) {
            buttonColor1 = Colors.green;
          }
          if (correctAnswer == 2) {
            buttonColor2 = Colors.green;
          }
          if (correctAnswer == 3) {
            buttonColor3 = Colors.green;
          }
        }
      }
    });
  }

  void nextButton() {
    setState(
      () {
        questionIndex = questionIndex + 1;
        buttonColor1 = Colors.grey;
        buttonColor2 = Colors.grey;
        buttonColor3 = Colors.grey;
        buttonColor4 = Colors.grey;
        button1Icon = returnNothing();
        button2Icon = returnNothing();
        button3Icon = returnNothing();
        button4Icon = returnNothing();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddQuestions(questions),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Stack(
        children: [
          /* WebsafeSvg.asset("assets/bg.svg"), */
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
                /* qSlider(), */
                QuestionCounter(
                    "Question ${questionIndex + 1}/${questions.length}"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          QuestionText(
                              questions[questionIndex]['questionText']),
                          SizedBox(
                            height: 30,
                          ),
                          Options(
                              checkAnswer,
                              buttonColor1,
                              setColor,
                              button1Icon,
                              questions[questionIndex]["alternatives"][0],
                              1,
                              userAnswers,
                              questionIndex,
                              nextButton),
                          Options(
                              checkAnswer,
                              buttonColor2,
                              setColor,
                              button2Icon,
                              questions[questionIndex]["alternatives"][1],
                              2,
                              userAnswers,
                              questionIndex,
                              nextButton),
                          Options(
                              checkAnswer,
                              buttonColor3,
                              setColor,
                              button3Icon,
                              questions[questionIndex]["alternatives"][2],
                              3,
                              userAnswers,
                              questionIndex,
                              nextButton),
                          Options(
                              checkAnswer,
                              buttonColor4,
                              setColor,
                              button4Icon,
                              questions[questionIndex]["alternatives"][3],
                              4,
                              userAnswers,
                              questionIndex,
                              nextButton),
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

class ModalResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "😁",
            style: TextStyle(fontSize: 25),
          ),
          Text(
            'Good job',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
