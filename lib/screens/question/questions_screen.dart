import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/widgets/common/background_decoration.dart';

class QuestionScreen extends ConsumerWidget {
  static const String routeName = "/questions-screen";
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: BackgroundDecoration(
        child: Center(
          child: Text("Welcome question screen"),
        ),
      ),
    );
  }
}
