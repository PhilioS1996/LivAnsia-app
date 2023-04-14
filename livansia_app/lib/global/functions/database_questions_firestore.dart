import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:livansia_app/helpers/imports.dart';

import '../../models/get_quest.dart';
// import '../../models/getQuote.dart';

class DatabaseService2 with ChangeNotifier {
  final CollectionReference questionnaireCol =
      FirebaseFirestore.instance.collection('showQuestions');

  final CollectionReference quotesRefer =
      FirebaseFirestore.instance.collection('Quotes');

  final CollectionReference famousQ =
      FirebaseFirestore.instance.collection('FamousQ');

  List<GetQuest>? listQuestions = [];
  List<GetQuest> _questionsFromSnapshot(QuerySnapshot snapshot) {
    final reference = questionnaireCol.withConverter(
      fromFirestore: GetQuest.fromFirestore,
      toFirestore: (GetQuest questions, _) => questions.toFirestore(),
    );

    reference.get().then((value) {
      QuerySnapshot<GetQuest> docSnap = value;
      listQuestions = docSnap.docs.cast<GetQuest>();
    });
    return listQuestions!;
    // return snapshot.docs.map((doc2) {
    //   return GetQuest(
    //     name: doc2.data['name'] ?? '',

    //     ///_userDataFromSnapshot opws ekei
    //   );
    // }).toList();
  }

  Stream<List<GetQuest>> readQuestions() {
    Stream<List<GetQuest>> streamedQuestions = FirebaseFirestore.instance
        .collection('showQuestions')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => GetQuest.fromJson(document.data()))
            .toList());
    streamedQuestions.map((event) {
      for (var element in event) {
        listQuestions!.add(element);
      }
    });
    notifyListeners();
    return streamedQuestions;
  }

  Stream<List<GetQuest>> get question {
    return questionnaireCol.snapshots().map(_questionsFromSnapshot);
  }

  // List<GetFamous> _famousQFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc2) {
  //     return GetFamous(
  //       talk: doc2.data['talk'] ?? '',
  //     );
  //   }).toList();
  // }

  // Stream<List<GetFamous>> get famQuotes {
  //   return famousQ.snapshots().map(_famousQFromSnapshot);
  // }

  // List<GetQuotes> _quotesFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return GetQuotes(
  //       text: doc.data['textL'] ?? [],
  //       // doc.data['quo2']
  //     );
  //   }).toList();
  // }

  // Stream<List<GetQuotes>> get quotes1 {
  //   return quotesRefer
  //       .where('name', isEqualTo: 'category1')
  //       .snapshots()
  //       .map(_quotesFromSnapshot);
  // }

  // Stream<List<GetQuotes>> get quotes2 {
  //   return quotesRefer
  //       .where('name', isEqualTo: 'category2')
  //       .snapshots()
  //       .map(_quotesFromSnapshot);
  // }

  // Stream<List<GetQuotes>> get quotes3 {
  //   return quotesRefer
  //       .where('name', isEqualTo: 'category3')
  //       .snapshots()
  //       .map(_quotesFromSnapshot);
  // }

  // Stream<List<GetQuotes>> get quotes4 {
  //   return quotesRefer
  //       .where('name', isEqualTo: 'category4')
  //       .snapshots()
  //       .map(_quotesFromSnapshot);
  // }
}
