import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/firebase_ref/references.dart';

class FirebaseStorageService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child("question_paper_images")
          .child("${imgName.toLowerCase()}.png");
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      return null;
    }
  }
}

final firebaseStorageProvider = Provider<FirebaseStorageService>((ref) {
  return FirebaseStorageService();
});
