import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/extensions/context_extension.dart';

TextStyle cartTitles(BuildContext context) => TextStyle(
    color: context.isDarkMode
        ? context.textTheme.bodyText1!.color
        : context.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold);
const questionTS = TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
const TextStyle detailText = TextStyle(fontSize: 12);
const TextStyle headerText = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: onSurfaceTextColor);
