import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();
  factory Dialogs() {
    return _singleton;
  }

  static questionStartDialogue(
      {required VoidCallback onTap, required BuildContext context}) {
    return showDialog(
      useSafeArea: true,
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Hi...",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text("Please login before you start")
          ],
        ),
        actions: [
          TextButton(
            onPressed: onTap,
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }
}
