import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String uid;

  Users({required this.uid});
}

class UserData {
  String? uid;
  final List? dedomena;
  final List? parousies;
  final DateTime? input;
  // final List questionsAnswer;
  int? score;
  final String? thougths;
  final String? am;
  String? gender;
  String? born;

  UserData({
    this.uid,
    this.dedomena,
    this.parousies,
    this.input,
    // this.questionsAnswer,
    this.score,
    this.thougths,
    this.am,
    this.gender,
    this.born,
  });
//  uid: uid,
//         dedomena: snapshot.data['$dAfter'],
//         input: snapshot.data['$dAfter '],
//         parousies: snapshot.data['Attendance'],
//         // questionsAnswer: snapshot.data['$date'],
//         score: snapshot.data['score'],
//         // am: snapshot.data['AM'],
//         gender: snapshot.data['Gender'],
//         born: snapshot.data['Birth_Date'],
//         thougths: snapshot.data['$date thoughts']);
  factory UserData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserData(
      dedomena: data?['dAfter'] is Iterable ? List.from(data?['dAfter']) : null,
      input: data?['dAfter'],
      parousies: data?['Attendance'] is Iterable
          ? List.from(data?['Attendance'])
          : null,
      score: data?['score'],
      gender: data?['Gender'],
      thougths: (data?['date'] ?? '') + 'thoughts',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      // if (name != null) "dAfter": name,
      // if (state != null) "state": state,
      // if (country != null) "country": country,
      // if (capital != null) "capital": capital,
      // if (population != null) "population": population,
      // if (regions != null) "regions": regions,
    };
  }
}
