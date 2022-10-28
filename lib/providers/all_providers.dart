import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/controllers/question_papers/data_uploader.dart';
import 'package:study_app/controllers/question_papers/question_paper_controller.dart';
import 'package:study_app/controllers/theme_controller.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';
import 'package:study_app/firebase_ref/loading_status.dart';

import '../controllers/auth_controller.dart';

final ThemeControllerProvider = Provider<ThemeController>((ref) {
  return ThemeController();
});

final loadingStatusProvider = StateProvider<LoadingStatus>((ref) {
  return LoadingStatus.loading;
});
final zoomDrawerProvider = Provider((ref) {
  return MyZoomDrawerController();
});
final dataProvider = Provider<DataUploader>((ref) {
  return DataUploader(
    ref: ref,
  );
});
final questionPaperControllerProvider =
    ChangeNotifierProvider<QuestionPaperController>((ref) {
  return QuestionPaperController(ref);
});
final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(
    auth: FirebaseAuth.instance,
  );
});
