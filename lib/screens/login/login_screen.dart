import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/providers/all_providers.dart';

import 'package:study_app/widgets/common/main_button.dart';

class LoginScreen extends ConsumerWidget {
  static const String routeName = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_splash_logo.png",
              width: 200,
              height: 200,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
              child: Text(
                "This is a study app. You can use as you want. You have the full access to all the materials in this course.",
                style: TextStyle(
                    color: onSurfaceTextColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            MainButton(
              isSvg: true,
              title: "Sign In With Google",
              press: () {
                ref.read(authControllerProvider).signInWithGoogle(
                      context,
                    );
              },
              svgPic: "assets/icons/google.svg",
            )
          ],
        ),
      ),
    );
  }
}
