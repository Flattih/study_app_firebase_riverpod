import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/extensions/logger.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:study_app/providers/all_providers.dart';
import 'package:study_app/screens/question/questions_screen.dart';
import 'package:study_app/services/firebase_storage_service.dart';

class QuestionPaperController extends ChangeNotifier {
  final Ref ref;
  final List<QuestionPaperModel> _allPapers = [];

  QuestionPaperController(this.ref);
  List<QuestionPaperModel> get allPapers => _allPapers;

  Future<void> getAllPapers(WidgetRef ref) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRef.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.addAll(paperList);
      for (var paper in paperList) {
        final imgUrl =
            await ref.read(firebaseStorageProvider).getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.setAll(0, paperList);

      notifyListeners();
    } catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToQuestions(
      {required BuildContext context,
      required QuestionPaperModel paper,
      bool tryAgain = false}) {
    if (ref.watch(authControllerProvider).isLoggedIn()) {
      if (tryAgain) {
        Navigator.pop(context);
      } else {
        Navigator.pushNamed(context, QuestionScreen.routeName,
            arguments: paper);
      }
    } else {
      ref.watch(authControllerProvider).showLoginAlertDialogue(context);
    }
  }
}
