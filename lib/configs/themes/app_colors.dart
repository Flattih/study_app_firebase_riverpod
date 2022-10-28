import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_dark_theme.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';
import 'package:study_app/extensions/context_extension.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryLightColorLight, primaryColorLight],
);
const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryDarkColorDark, primaryColorDark],
);

LinearGradient mainGradient(BuildContext context) =>
    context.isDarkMode ? mainGradientDark : mainGradientLight;
Color customScaffoldColor(BuildContext context) => context.isDarkMode
    ? const Color(0xFF2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);
Color answerSelectedColor(BuildContext context) => context.isDarkMode
    ? context.theme.cardColor.withOpacity(0.5)
    : context.theme.primaryColor;
Color answerBorderColor(BuildContext context) => context.isDarkMode
    ? const Color.fromARGB(255, 20, 46, 158)
    : const Color.fromARGB(255, 221, 221, 221);
