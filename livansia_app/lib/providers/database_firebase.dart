import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:livansia_app/models/users.dart';

import '../../models/slider_answer_model.dart';

// import '../../models/getAnswers.dart';

List atte = [];
//List katiii;

class DatabaseService with ChangeNotifier {
  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference questionnaireCol =
      FirebaseFirestore.instance.collection('Answers');
  final CollectionReference answersCollection =
      FirebaseFirestore.instance.collection('Answers2');
  final CollectionReference questionnaireEvents =
      FirebaseFirestore.instance.collection('Answers');

  final CollectionReference docEvents =
      FirebaseFirestore.instance.collection('Events');

  var date1 = DateTime.now();
  String date = DateFormat.yMMMd().format(DateTime.now());

  var dateAfter;
  var dAfter;
  // List questionsAnswers;
  int score = 0;

  Future setUserEvents(DateTime logEvent) async {
    logEvent = DateTime.now();
    String hmer = DateFormat.yMMMd().add_jm().format(logEvent);

    return questionnaireEvents.doc(uid).collection('Events').doc(hmer).set({
      'date': logEvent,
    });
  }

  Future upEvent(DateTime timeDay) async {
    var hmer = DateFormat.yMMMd().add_jm().format(timeDay);
    return questionnaireEvents.doc(uid).collection('Events').doc(hmer).update({
      'date': timeDay,
    });
  }

  Future setUserData(
    List dedomena,
    attendance,
    int selectedOptionJob,
    int useSocial,
    String gender,
    String born,
  ) async {
    return await answersCollection.doc(uid).set({
      '$dAfter dedomena': dedomena,
      //'AM': am,
      'Gender': gender,
      'Age': born,
      'Job_Key': selectedOptionJob,
      'Use_social': useSocial
    });
  }

  Future setUserDataNew(
    List dedomena,
    attendance,
    int selectedOptionJob,
    int useSocial,
    String gender,
    String born,
  ) async {
    return await answersCollection.doc(uid).set({
      'Data': dedomena,
      //'AM': am,
      'Gender': gender,
      'Age': born,
      'Job_Key': selectedOptionJob,
      'Use_social': useSocial
    });
  }

  Future<void> updateUserData(List<QuestionAnswers> dedomena) async {
    final DocumentReference docRef = answersCollection.doc(uid);

    try {
      dateAfter = DateTime.now();
      var dAfter = DateFormat.yMMMd().add_jm().format(dateAfter);
      Map<String, dynamic> answers = {};

      for (int count = 0; count < dedomena.length; count++) {
        answers[count.toString()] =
            'Box ${dedomena[count].questionIndex} : ${dedomena[count].valueSelected} ${dedomena[count].textAnswer != '' ? '/text : ${dedomena[count].textAnswer}' : ''} ';
      }

      // Set a new field with the current timestamp as the field name
      await docRef.set({
        dAfter: answers,
      }, SetOptions(merge: true));
    } catch (e) {
      if (kDebugMode) {
        print('Error updating user data: $e');
      }
    }
  }

  Future updateUserDataS(int score) async {
    dateAfter = DateTime.now();
    var dAfter = DateFormat.yMMMd().add_jm().format(dateAfter);
    return await answersCollection.doc(uid).update({
      '$dAfter score': score,
    });
  }

  List attendance = [];
  Future updateUserEvent(DateTime timeDay) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

    String tday = formatter.format(timeDay);

    attendance.add(tday);

    return await answersCollection.doc(uid).update(
      {
        'Attendance': attendance,
      },
    );
  }

  Future updateUserInfo(
      String gender, String born, int selectedOptionJob, int useSocial) async {
    // final List<GetQuest> mikos =new List<GetQuest>();
    return await answersCollection.doc(uid).update({
      'Gender': gender,
      'Age': born,
      'Job_Key': selectedOptionJob,
      'Use_social': useSocial
    });
  }

  Future updateUserDataThougths(String thoughts) async {
    dateAfter = DateTime.now();
    String dAfter = DateFormat.yMMMd().add_jm().format(dateAfter);

    return await answersCollection.doc(uid).update({
      '$dAfter thoughts': thoughts,
    });
  }

  //user data from snapshot

  UserData? _userDataFromSnapshot(DocumentSnapshot snapshot) {
    UserData? userData;
    final ref = answersCollection.doc(uid).withConverter(
          fromFirestore: UserData.fromFirestore,
          toFirestore: (UserData city, _) => city.toFirestore(),
        );
    ref.get().then((value) {
      DocumentSnapshot<UserData> docSnap = value;
      userData = docSnap.data();
    });

    return userData;
  }

  //get user doc stream
  Stream<UserData?> get userData {
    Stream<UserData?> streamApp =
        answersCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
    return streamApp;
  }
}
