import 'package:flutter/cupertino.dart';
import 'package:quizzly/screens/quiz_screen.dart';
import 'package:quizzly/services/data/database/quizzly.dart';

class IntroController {
  void Function(void Function() fn) updater;

  IntroController({required this.updater});

  static void Function(BuildContext context) currentLevel = buttonLevelOne;

  static void buttonLevelOne(BuildContext context) {
    Navigator.of(context).pushNamed(QuizScreen.id, arguments: QuizData.levelOne());
    currentLevel = buttonLevelOne;
  }

  static void buttonLevelTwo(BuildContext context) {
    Navigator.of(context).pushNamed(QuizScreen.id, arguments: QuizData.levelTwo());
    currentLevel = buttonLevelTwo;
  }

  static void buttonLevelThree(BuildContext context) {
    Navigator.of(context).pushNamed(QuizScreen.id, arguments: QuizData.levelThree());
    currentLevel = buttonLevelThree;
  }
}