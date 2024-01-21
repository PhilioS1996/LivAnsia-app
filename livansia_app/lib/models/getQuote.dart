import 'package:cloud_firestore/cloud_firestore.dart';

class GetQuotes {
  final List text;

  GetQuotes({required this.text});
  static GetQuotes fromJson(Map<String, dynamic> json) =>
      GetQuotes(text: json['textL']);

  factory GetQuotes.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return GetQuotes(text: data?['textL']);
  }

  Map<String, dynamic> toFirestore() {
    return {};
  }
}
