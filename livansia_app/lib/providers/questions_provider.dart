import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:livansia_app/helpers/imports.dart';

import '../../models/get_quest.dart';
import '../global/functions/database_firebase.dart';
import '../models/slider_answer_model.dart';
import '../services/authedication_service.dart';

class QuestionsProvider with ChangeNotifier {
  List<SliderAnswers> sliderAnswers = [];
  List<GetQuest>? listQuestions = [];

  void setSliderAnswersList(int questionsLength) {
    sliderAnswers = List.filled(
        questionsLength, SliderAnswers(questionIndex: -1, valueSelected: -1),
        growable: true);
  }

  void setValuePickedSlider(int valueSlider, int index) {
    sliderAnswers
        .add(SliderAnswers(questionIndex: index, valueSelected: valueSlider));

    notifyListeners();
  }

  void printSliderAnswers(BuildContext context) async {
    final authService = Provider.of<AuthService>(context,
        listen: false); // Access AuthService using Provider
    if (authService != null) {
      // Check if AuthService instance exists
      final user = authService.userSignIn;
      print(user);
      await DatabaseService(uid: user!.uid).updateUserData(sliderAnswers);
    }

    print('to length einai :  ${sliderAnswers.length}');
    for (int i = 0; i < sliderAnswers.length; i++) {
      print(
          'To index tis erwtiseis einai ${sliderAnswers[i].questionIndex} kai i timi einai : ${sliderAnswers[i].valueSelected}');
      // print(sliderAnswers[i].valueSelected);
    }
  }

  Future<void> writeQuestionsFromFirebase() async {
// Get a reference to the Firestore collection
    // FirebaseFirestore.instance.collection('showQuestions').snapshots()
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
