import 'package:cloud_firestore/cloud_firestore.dart';

class GetQuest {
  final String name;

  GetQuest({required this.name});

  static GetQuest fromJson(Map<String, dynamic> json) =>
      GetQuest(name: json['name']);

  factory GetQuest.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return GetQuest(name: data?['name']);
  }

  Map<String, dynamic> toFirestore() {
    return {};
  }

  toList() {}
}

class GetFamous {
  final String talk;

  GetFamous({required this.talk});
  factory GetFamous.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return GetFamous(talk: data?['talk']);
  }

  Map<String, dynamic> toFirestore() {
    return {};
  }
}
