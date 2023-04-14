import 'package:flutter/foundation.dart';
import 'package:livansia_app/helpers/imports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/get_quest.dart';

class QuestionsProvider with ChangeNotifier {
  List<int> sliderAnswers = [];
  List<GetQuest>? listQuestions = [];

  void setSliderAnswersList(int questionsLength) {
    sliderAnswers = List.filled(questionsLength, 0);
  }

  void setValuePickedSlider(int valueSlider, int index) {
    sliderAnswers[index] = valueSlider;
    notifyListeners();
  }

  // Future<void> readQuestionsFromFirebase() async {
  //   Stream<List<GetQuest>> streamedQuestions = FirebaseFirestore.instance
  //       .collection('showQuestions')
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs
  //           .map((document) => GetQuest.fromJson(document.data()))
  //           .toList());
  //   streamedQuestions.map((event) {
  //     for (var element in event) {
  //       listQuestions!.add(element);
  //     }

  //     print('listQuestions > ${listQuestions!.length}');
  //   });
  //   notifyListeners();
  //   //return streamedQuestions;
  // }
}
