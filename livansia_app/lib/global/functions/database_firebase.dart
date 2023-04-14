import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';
import 'package:livansia_app/models/users.dart';

// import '../../models/getAnswers.dart';

List atte = [];
//List katiii;

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference questionnaireCol =
      FirebaseFirestore.instance.collection('Answers');

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
    return await questionnaireCol.doc(uid).set({
      '$dAfter dedomena': dedomena,
      //'AM': am,
      'Gender': gender,
      'Birth_Date': born,
    });
  }

//FieldValue.arrayUnion(questionsAnswer)

  Future<void> updateUserData(List dedomena) async {
    dateAfter = DateTime.now();

    if (dateAfter.isAfter(date1)) {
      //&& answers != null
      var dAfter = DateFormat.yMMMd().add_jm().format(dateAfter);

      await questionnaireCol.doc(uid).update({
        '$dAfter ': dedomena,
      });
    } else {
      await questionnaireCol.doc(uid).update({
        '$date ': dedomena,
      });
    }
  }

  Future updateUserDataS(int score) async {
    dateAfter = DateTime.now();
    var dAfter = DateFormat.yMMMd().add_jm().format(dateAfter);
    return await questionnaireCol.doc(uid).update({
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

    return await questionnaireCol.doc(uid).update(
      {
        'Attendance': attendance,
      },
    );
  }

  Future updateUserInfo(String gender, String born) async {
    // final List<GetQuest> mikos =new List<GetQuest>();
    return await questionnaireCol.doc(uid).update({
      'Gender': gender,
      'Birth_Date': born,
    });
  }

  // Future updateUserAM(String am) async {
  //   // final List<GetQuest> mikos =new List<GetQuest>();
  //   return await questionnaireCol.document(uid).update({
  //     'AM': am,
  //   });
  // }

  Future updateUserDataThougths(String thoughts) async {
    dateAfter = DateTime.now();
    String dAfter = DateFormat.yMMMd().add_jm().format(dateAfter);

    return await questionnaireCol.doc(uid).update({
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
    final ref = questionnaireCol.doc(uid).withConverter(
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
  //   return questionnaireCol.snapshots().map(_answersFromSnapshots);
  // }

  //get user doc stream
  Stream<UserData?> get userData {
    //questionnaireCol.doc(uid).snapshots().map(
    Stream<UserData?> streamApp =
        questionnaireCol.doc(uid).snapshots().map(_userDataFromSnapshot);
    return streamApp;
  }
}
