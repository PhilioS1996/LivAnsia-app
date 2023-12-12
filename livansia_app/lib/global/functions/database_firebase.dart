import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';
import 'package:livansia_app/models/users.dart';

import '../../models/slider_answer_model.dart';

// import '../../models/getAnswers.dart';

List atte = [];
//List katiii;

class DatabaseService {
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
    return questionnaireEvents.doc(uid).collection('Events').doc('$hmer').set({
      'date': timeDay,
    });
  }

  Future setUserData(
    List dedomena,
    attendance,
    //String am,
    String gender,
    String born,
  ) async {
    return await answersCollection.doc(uid).set({
      '$dAfter dedomena': dedomena,
      //'AM': am,
      'Gender': gender,
      'Birth_Date': born,
    });
  }

  Future setUserDataNew(
    List dedomena,
    attendance,
    //String am,
    String gender,
    String born,
  ) async {
    return await answersCollection.doc(uid).set({
      'Data': dedomena,
      //'AM': am,
      'Gender': gender,
      'Birth_Date': born,
    });
  }
//FieldValue.arrayUnion(questionsAnswer)

  // Future<void> updateUserData(List<SliderAnswers> dedomena) async {
  //   final DocumentReference docRef = answersCollection.doc(uid);
  //   docRef.get().then((DocumentSnapshot docSnapshot) async {
  //     if (docSnapshot.exists) {
  //       final data = docSnapshot.data() as Map<String, dynamic>;
  //       final List<dynamic> list = data['Data'] ?? [];
  //       final int length = list.length;
  //       print(length);
  //       dateAfter = DateTime.now();

  //       if (dateAfter.isAfter(date1)) {
  //         //&& answers != null
  //         Map answers = {};
  //         var dAfter = DateFormat.yMMMd().add_jm().format(dateAfter);
  //         for (int count = 0; count < dedomena.length; count++) {
  //           answers[count.toString()] =
  //               'Box ${dedomena[count].questionIndex} : ${dedomena[count].valueSelected}';
  //         }
  //         await answersCollection.doc(uid).update({
  //           '$dAfter ': answers,
  //         }, SetOptions(merge: false));
  //       } else {
  //         await answersCollection.doc(uid).update({
  //           '$date ': dedomena.toList(),
  //         });
  //       }
  //     }
  //   });
  // }
// chat gpt
  Future<void> updateUserData(List<SliderAnswers> dedomena) async {
    final DocumentReference docRef = answersCollection.doc(uid);

    try {
      dateAfter = DateTime.now();
      var dAfter = DateFormat.yMMMd().add_jm().format(dateAfter);
      Map<String, dynamic> answers = {};

      for (int count = 0; count < dedomena.length; count++) {
        answers[count.toString()] =
            'Box ${dedomena[count].questionIndex} : ${dedomena[count].valueSelected}';
      }

      // Set a new field with the current timestamp as the field name
      await docRef.set({
        '$dAfter': answers,
      }, SetOptions(merge: true));
    } catch (e) {
      print('Error updating user data: $e');
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
    // //timeDay.fo (
    //     timeDay, [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss]);

    attendance.add(tday);

    return await answersCollection.doc(uid).update(
      {
        'Attendance': attendance,
      },
    );
  }

  Future updateUserInfo(String gender, String born) async {
    // final List<GetQuest> mikos =new List<GetQuest>();
    return await answersCollection.doc(uid).update({
      'Gender': gender,
      'Birth_Date': born,
    });
  }

  // Future updateUserAM(String am) async {
  //   // final List<GetQuest> mikos =new List<GetQuest>();
  //   return await answersCollection.document(uid).update({
  //     'AM': am,
  //   });
  // }

  Future updateUserDataThougths(String thoughts) async {
    dateAfter = DateTime.now();
    String dAfter = DateFormat.yMMMd().add_jm().format(dateAfter);

    return await answersCollection.doc(uid).update({
      '$dAfter thoughts': thoughts,
    });
  }

  // List<GetAnswers> _answersFromSnapshots(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc) {
  //     return GetAnswers(
  //       input: doc.data['$dAfter '] ?? null,
  //       dedomena: doc.data(),
  //       //dedomena: doc.data(dAfter)  ?? [],
  //       //parousies: doc.data['Attendance'],
  //       score: doc.data[' score'] ?? 0,
  //       thoughts: doc.data['$date thoughts'] ?? '',
  //       am: doc.data['AM'] ?? '0',
  //       gender: doc.data['Gender'] ?? '',
  //       born: doc.data['Birth_Date'] ?? '', ,
  //     );
  //   }).toList();
  // }

  // List<EventDate> _datesFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc2) {
  //     return EventDate.fromMap(doc2);
  //   }).toList();
  // }

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

    // userData.uid = uid;
    // userData = UserData.fromFirestore
    return userData;
    // UserData(
    //     uid: uid,
    //     dedomena: ref.['$dAfter'] ?? '',
    //     input: snapshot['$dAfter '] ?? '',
    //     parousies: snapshot['Attendance'],
    //     // questionsAnswer: snapshot.data['$date'],
    //     score: snapshot['score'],
    //     // am: snapshot.data['AM'],
    //     gender: snapshot['Gender'],
    //     born: snapshot['Birth_Date'],
    //     thougths: snapshot['$date thoughts']);
  }

  // Stream<List<GetAnswers>> get answers {
  //   return answersCollection.snapshots().map(_answersFromSnapshots);
  // }

  //get user doc stream
  Stream<UserData?> get userData {
    //answersCollection.doc(uid).snapshots().map(
    Stream<UserData?> streamApp =
        answersCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
    return streamApp;
  }
}
