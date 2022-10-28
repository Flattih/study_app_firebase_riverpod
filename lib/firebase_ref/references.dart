import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
final questionPaperRef = fireStore.collection('questionPapers');
final userRef = fireStore.collection("users");
Reference get firebaseStorage => FirebaseStorage.instance.ref();

DocumentReference questionRF(
        {required String paperId, required String questionId}) =>
    questionPaperRef.doc(paperId).collection("questions").doc(questionId);
