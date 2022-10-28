import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/configs/themes/app_colors.dart';

import 'package:study_app/providers/all_providers.dart';

class SplashScreen extends ConsumerWidget {
  static const String routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider).navigateToIntroduction(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient(context)),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/app_splash_logo.png",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
