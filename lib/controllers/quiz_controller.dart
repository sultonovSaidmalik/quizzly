import 'package:flutter/cupertino.dart';
import 'package:quizzly/models/quiz_model.dart';
import 'package:quizzly/screens/answer_screen.dart';

class QuizController {
  void Function(void Function() fn) updater;

  late List<Quiz> dataQuiz;
  int currentQuiz = 0;
  late Quiz quiz;
  late final AnimationController animationController;
  bool isAnimate = false;

  QuizController(
      {required this.updater});

  void changeQuiz(num? newAnswer, BuildContext context) {
    quiz.answer =
        newAnswer == null ? 0 : (newAnswer == quiz.trueAnswer ? 1 : 2);

    currentQuiz++;
    if (currentQuiz >= dataQuiz.length) {
      Navigator.pushNamed(context, AnswerScreen.id, arguments: dataQuiz);
    } else {
      quiz = dataQuiz[currentQuiz];
      if (quiz.second != 1000) {
        isAnimate = true;
        animationController.reset();
        animationController.reverse(
          from: animationController.value == 0.0
              ? 1.0
              : animationController.value,
        );
      }
    }
    updater(() {});
  }

  void changer(AnimationStatus status, BuildContext context) {
    if (status == AnimationStatus.dismissed) {
      if (!isAnimate) {
        changeQuiz(null, context);
        isAnimate = false;
      }
      animationController.reverse(
        from:
            animationController.value == 0.0 ? 1.0 : animationController.value,
      );
    }
  }
}
