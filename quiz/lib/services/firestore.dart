import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizzapp/services/auth.dart';
import 'package:quizzapp/services/models.dart';
import 'package:rxdart/rxdart.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Topic>> getTopics() async {
    final ref = _db.collection('topics');
    final snapshot = await ref.get();
    final data = snapshot.docs.map((e) => e.data());
    final topics = data.map((e) => Topic.fromJson(e));

    return topics.toList();
  }

  Future<Quiz> getQuiz(String quizId) async {
    final ref = _db.collection('quizzes').doc(quizId);
    final snapshot = await ref.get();

    return Quiz.fromJson(snapshot.data() ?? {});
  }

  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        final ref = _db.collection('reports').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }

  Future<void> updateUserReport(Quiz quiz) {
    var user = AuthService().user!;
    var ref = _db.collection('reports').doc(user.uid);

    var data = {
      'total': FieldValue.increment(1),
      'topics': {
        quiz.topic: FieldValue.arrayUnion([quiz.id])
      }
    };

    return ref.set(data, SetOptions(merge: true));
  }
}
