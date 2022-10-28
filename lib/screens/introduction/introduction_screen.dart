import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/extensions/context_extension.dart';
import 'package:study_app/screens/home/home_screen.dart';
import 'package:study_app/widgets/app_circle_button.dart';
import 'package:study_app/widgets/dialogs/dialogue_widget.dart';

class AppIntroductionScreen extends StatefulWidget {
  static const String routeName = "/app-introduction";
  const AppIntroductionScreen({super.key});

  @override
  State<AppIntroductionScreen> createState() => _AppIntroductionScreenState();
}

class _AppIntroductionScreenState extends State<AppIntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient(context)),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.2),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              onTap: () =>
                  Dialogs.questionStartDialogue(onTap: () {}, context: context),
              child: const Icon(
                Icons.star,
                size: 65,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              textAlign: TextAlign.center,
              'Welcome the test application',
              style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            AppCircleButton(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.routeName, (route) => false),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 35,
                ))
          ]),
        ),
      ),
    );
  }
}
