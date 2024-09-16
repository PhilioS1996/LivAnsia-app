import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:livansia_app/models/get_answers.dart';
import 'package:livansia_app/models/get_quote.dart';
import 'package:intl/intl.dart';
import '../../models/get_quest.dart';

class DatabaseServiceProvider with ChangeNotifier {
  final CollectionReference questionnaireCol =
      FirebaseFirestore.instance.collection('showQuestions');

  final CollectionReference quotesRefer =
      FirebaseFirestore.instance.collection('Quotes');

  final CollectionReference famousQ =
      FirebaseFirestore.instance.collection('FamousQ');
  final CollectionReference answersCollection =
      FirebaseFirestore.instance.collection('Answers2');

  String ageUser = '';
  String genderUser = '';
  String jobUser = '';
  List<GetQuest>? listQuestions = [];
  List<String>? listQuotes = [];
  List<DateTime> presentationDates = [];
  Map<DateTime, List<dynamic>> eventsPresDates = <DateTime, List<dynamic>>{};

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

  Future printDocs(uid) async {
    DocumentSnapshot documentSnapshot = await answersCollection.doc(uid).get();
    RegExp regexNumbersOnly = RegExp(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$');
    List<Answer> answers = [];

    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      data.forEach((key, value) {
        answers.add(Answer.fromJson({key: value}));
      });
      for (int j = 0; j < answers.length; j++) {
        for (var element in answers[j].data.keys) {
          if (kDebugMode) {
            print('mesa sti function ${answers[j].data.keys}');
          }
          if (regexNumbersOnly.hasMatch(element)) {
            final dateString = element;
            final formattedDate = dateString.replaceAll(' ', 'T');
            final parsedDate =
                DateFormat("yyyy-MM-dd'T'HH:mm").parse(formattedDate);
            // DateTime date = DateFormat('y,M,d').parse(element);
            print('mesa sti function $parsedDate');
            presentationDates.add(parsedDate);
            eventsPresDates[parsedDate] = ['Επιτυχείς Καταχώρηση'];
          }
        }
      }
    }
  }

  Future getUserAge(uid) async {
    try {
      // Use await to wait for the completion of the Future<DocumentSnapshot>
      DocumentSnapshot documentSnapshot =
          await answersCollection.doc(uid).get();
      // Check if the document exists before accessing data
      if (documentSnapshot.exists) {
        ageUser = documentSnapshot['Age'];
        notifyListeners();
      } else {
        if (kDebugMode) {
          print('Document does not exist');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving data: $e');
      }
    }
  }

  Future getUserGender(uid) async {
    try {
      // Use await to wait for the completion of the Future<DocumentSnapshot>
      DocumentSnapshot documentSnapshot =
          await answersCollection.doc(uid).get();

      // Check if the document exists before accessing data
      if (documentSnapshot.exists) {
        // Access data() on the DocumentSnapshot
        // var userData = documentSnapshot.data();
        genderUser = documentSnapshot['Gender'];

        notifyListeners();
      } else {
        if (kDebugMode) {
          print('Document does not exist');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving data: $e');
      }
    }
  }

  Future getUserJob(uid) async {
    try {
      // Use await to wait for the completion of the Future<DocumentSnapshot>
      DocumentSnapshot documentSnapshot =
          await answersCollection.doc(uid).get();

      // Check if the document exists before accessing data
      if (documentSnapshot.exists) {
        var tempJob = documentSnapshot['Job_Key'];
        switch (tempJob) {
          case 1:
            jobUser = "Εργαζόμενη/ος";
            break;
          case 2:
            jobUser = "Φοιτήτρια/της";
            break;
          case 3:
            jobUser = "Άνεργος";
            break;
          default:
            jobUser = '';
        }

        notifyListeners();
      } else {
        if (kDebugMode) {
          print('Document does not exist');
        }
        return null; // Or handle the case where the document doesn't exist
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving data: $e');
      }
      return null; // Or handle the error as needed
    }
  }

  Future<void> fetchData() async {
    try {
      // Get a reference to the "Quotes" collection
      CollectionReference quotesCollection =
          FirebaseFirestore.instance.collection('Quotes');

      // Get a reference to the "category3" document
      DocumentSnapshot category3Document =
          await quotesCollection.doc('category3').get();
      // Check if the document exists
      if (category3Document.exists) {
        // Retrieve data from the "category3" document
        List<dynamic> rawTexts = category3Document['textL'];

        // Cast the dynamic list to the correct type (List<GetQuotes>)
        GetQuotes texts = (GetQuotes(text: rawTexts));
        listQuotes = texts.text.cast<String>();
      } else {
        if (kDebugMode) {
          print('Document does not exist');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }
}
