import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../widgets/options.dart';

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

List questions = const [
  {
    'questionText':
        'Which theory moves away from individual to social and environmental explanations of crime?',
    "alternatives": [
      'Left realism',
      'Right realism',
      'Chicago school',
      'Critical criminology'
    ],
    'correctAnswer': 'Chicago school',
  },
  {
    'questionText':
        'Which theory moves away from individual to social and environmental explanations of crime?',
    "alternatives": [
      'Hello',
      'Right realism',
      'Chicago school',
      'Critical criminology'
    ],
    'correctAnswer': 'Chicago school',
  },
  {
    'questionText':
        'Which theory moves away from individual to social and environmental explanations of crime?',
    "alternatives": [
      'Left realism',
      'Right realism',
      'Chicago school',
      'Critical criminology'
    ],
    'correctAnswer': 'Chicago school',
  },

  /* {
    'questionText': 'What does Ehtnography mean?',
    'alternatives': [],
    'correctAnswer': 'The up close study of a population',
  },
  {
    'questionText': 'What is human ecology?',
    'alternatives': [],
    'correctAnswer': 'the study of the human environment'
  },
  {
    'questionText': 'What was the theory of Ernest Burgess?',
    'alternatives': [],
    'correctAnswer': 'zonal hypothesis'
  },
  {
    'questionText':
        'Which was the zone with most crime according to Ernest Burgess?',
    'alternatives': [],
    'correctAnswer': 'the zone in transition'
  },
  {
    'questionText':
        'In contrast to focus on the individual aspects of crime, what does the Chicago school focus on',
    'alternatives': [],
    'correctAnswer': 'social and environmental explanations of crime'
  },
  {
    'questionText': 'How does the term "functionalism" refer to crime',
    'alternatives': [],
    'correctAnswer': 'as a social construct'
  },
  {
    'questionText': 'Who created the theory : "The zonal hypothesis"?',
    'alternatives': [],
    'correctAnswer': 'ernest burgess'
  },
  {
    'questionText':
        'What are the names of the men who studied Juvenile delinquency, whose studies supported Burgess theory?',
    'alternatives': [],
    'correctAnswer': 'clifford shaw and henry mckay'
  }, */
];
String correctAnswer = questions[questionIndex]['correctAnswer'].toString();

class _QuizScreenState extends State<QuizScreen> {
  List<String> alternatives = questions[questionIndex]['alternatives'];

  void checkAnswer(String userAnswer) {
    userAnswer == correctAnswer ? {points = points + 1} : {points = points};

    //function timer
  }

  void setColor(userAnswer) {
    setState(() {
      if (userAnswer == correctAnswer) {
        if (userAnswer == alternatives[0]) {
          buttonColor1 = Colors.green;
          button1Icon = Icon(
            Icons.check,
            color: buttonColor1,
          );
        }
        if (userAnswer == alternatives[1]) {
          buttonColor2 = Colors.green;
          button2Icon = Icon(
            Icons.check,
            color: buttonColor2,
          );
        }
        if (userAnswer == alternatives[2]) {
          buttonColor3 = Colors.green;
          button3Icon = Icon(
            Icons.check,
            color: buttonColor3,
          );
        }
        if (userAnswer == alternatives[3]) {
          buttonColor4 = Colors.green;
          button4Icon = Icon(
            Icons.check,
            color: buttonColor4,
          );
        }
      }
      if (userAnswer != correctAnswer) {
        if (userAnswer == alternatives[0]) {
          buttonColor1 = Colors.red;
          button1Icon = Icon(
            Icons.close,
            color: buttonColor1,
          );
          if (correctAnswer == alternatives[1]) {
            buttonColor2 = Colors.green;
          }
          if (correctAnswer == alternatives[2]) {
            buttonColor3 = Colors.green;
          }
          if (correctAnswer == alternatives[3]) {
            buttonColor4 = Colors.green;
          }
        }

        if (userAnswer == alternatives[1]) {
          buttonColor2 = Colors.red;
          button2Icon = Icon(
            Icons.close,
            color: buttonColor2,
          );
          if (correctAnswer == alternatives[0]) {
            buttonColor1 = Colors.green;
          }
          if (correctAnswer == alternatives[2]) {
            buttonColor3 = Colors.green;
          }
          if (correctAnswer == alternatives[3]) {
            buttonColor4 = Colors.green;
          }
        }

        if (userAnswer == alternatives[2]) {
          buttonColor3 = Colors.red;
          button3Icon = Icon(
            Icons.close,
            color: buttonColor3,
          );
          if (correctAnswer == alternatives[0]) {
            buttonColor1 = Colors.green;
          }
          if (correctAnswer == alternatives[1]) {
            buttonColor2 = Colors.green;
          }
          if (correctAnswer == alternatives[3]) {
            buttonColor4 = Colors.green;
          }
        }

        if (userAnswer == alternatives[3]) {
          buttonColor4 = Colors.red;
          button4Icon = Icon(
            Icons.close,
            color: buttonColor4,
          );
          if (correctAnswer == alternatives[0]) {
            buttonColor1 = Colors.green;
          }
          if (correctAnswer == alternatives[1]) {
            buttonColor2 = Colors.green;
          }
          if (correctAnswer == alternatives[2]) {
            buttonColor3 = Colors.green;
          }
        }
      }
    });
  }

  nextButton() {
    return TextButton(
      child: Text('Next question'),
      onPressed: () {
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
          TextButton(
            onPressed: () {},
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/bg.svg"),
          SafeArea(
            child: Column(
              children: [
                Slider(),
                QuestionCounter(),
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
                          QuestionText(),
                          Options(questions, questionIndex, 0, checkAnswer,
                              buttonColor1, setColor, button1Icon),
                          Options(questions, questionIndex, 1, checkAnswer,
                              buttonColor2, setColor, button2Icon),
                          Options(questions, questionIndex, 2, checkAnswer,
                              buttonColor3, setColor, button3Icon),
                          Options(questions, questionIndex, 3, checkAnswer,
                              buttonColor4, setColor, button4Icon),
                          nextButton(),
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

class Slider extends StatelessWidget {
  const Slider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF3f4768), width: 3),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("hello"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionCounter extends StatelessWidget {
  const QuestionCounter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Question ${questionIndex + 1}/${questions.length}",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

class QuestionText extends StatelessWidget {
  const QuestionText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      child: Text(
        questions[questionIndex]['questionText'],
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
