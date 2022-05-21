import 'package:cloud_firestore/cloud_firestore.dart';

class EventDate {
  DateTime dateE;

  EventDate({required this.dateE});

  factory EventDate.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return EventDate(
      dateE: data?['dateE'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      "dateE": dateE,
    };
  }
}
