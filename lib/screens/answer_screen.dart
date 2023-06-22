import 'package:flutter/material.dart';
import 'package:quizzly/controllers/answer_controller.dart';
import 'package:quizzly/models/quiz_model.dart';
import 'package:quizzly/services/constants/colors.dart';
import 'package:quizzly/services/constants/text_styles.dart';
import 'package:quizzly/services/l10n/app_localization.dart';
import 'package:quizzly/views/answer_widget/score_widget.dart';
import 'package:quizzly/views/app_routes.dart';
import 'package:quizzly/views/quiz_widget/answer_button.dart';
import 'package:quizzly/views/quiz_widget/back_button.dart';
import 'package:quizzly/views/quiz_widget/body_widget.dart';
import 'package:quizzly/views/quiz_widget/bottom_sheet_widget.dart';

class AnswerScreen extends StatefulWidget {
  static const id = "/answer";

  const AnswerScreen({Key? key}) : super(key: key);

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  late final AnswerController controller;
  late final AppLocalizations l10n;

  @override
  void initState() {
controller = AnswerController(updater: setState);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    l10n = AppLocalizations.of(context);
    super.didChangeDependencies();
    controller.answers = ModalRoute.of(context)!.settings.arguments as List<Quiz>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        height: MediaQuery.of(context).size.height * .45,
        child: SafeArea(
          child: Column(
            children: [
              AppBackButton(
                onPress: () => AppRoutes.goToIntro(context),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    ScoreWidget(controller: controller),
                    const SizedBox(height: 30),
                    AnswerStats(controller: controller),
                    const SizedBox(height: 30),
                    AnswerButton(
                      onPress: () => controller.tryAgain(context),
                      label: l10n.play,
                    ),
                    AnswerButton(
                      onPress: () => controller.gotoIntro(context),
                      label: l10n.home,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: const BottomSheetWidget(),
    );
  }
}

class AnswerStats extends StatelessWidget {
  const AnswerStats({
    super.key,
    required this.controller,
  });

  final AnswerController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.rgb,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: AppColors.c1F8435,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${controller.correct}",
                    style: AppTextStyles.dmsans20.copyWith(
                      color: AppColors.c1F8435,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: AppColors.cFA3939,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${controller.wrong}",
                    style: AppTextStyles.dmsans20.copyWith(
                      color: AppColors.cFA3939,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 40),
              Text(l10n.correct, style: AppTextStyles.dmsans16,),
              const SizedBox(width: 10),
              Text(l10n.wrong, style: AppTextStyles.dmsans16,),
              const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
