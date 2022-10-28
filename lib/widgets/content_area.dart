import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_colors.dart';

class ContentArea extends StatelessWidget {
  final bool addPadding;
  final Widget child;
  const ContentArea({super.key, this.addPadding = true, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        padding: addPadding
            ? const EdgeInsets.only(top: 25, left: 25, right: 25)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          color: customScaffoldColor(context),
        ),
        child: child,
      ),
    );
  }
}
