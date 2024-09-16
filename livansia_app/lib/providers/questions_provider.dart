import 'package:flutter/foundation.dart';
import 'package:livansia_app/global/show_snack_bar.dart';
import 'package:livansia_app/helpers/imports.dart';
import 'package:livansia_app/providers/database_firebase.dart';

import '../../models/get_quest.dart';
import '../models/slider_answer_model.dart';
import '../services/authedication_service.dart';

class QuestionsProvider with ChangeNotifier {
  List<QuestionAnswers> sliderAnswers = [];
  List<QuestionAnswers> finalAnswersList = [];
  List<GetQuest>? listQuestions = [];
  int lastComplexQuest = -1;
  TextEditingController screenTimeController = TextEditingController();
  TextEditingController screenTimeController1 = TextEditingController();
  TextEditingController screenTimeController2 = TextEditingController();
  TextEditingController appUseController = TextEditingController();
  TextEditingController textBoxController = TextEditingController();

  Color doubleTextContainerColor = const Color(0x2C009687);

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode1_2 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNodeBox = FocusNode();

  FocusNode get focusNode1 => _focusNode1;
  FocusNode get focusNode1_2 => _focusNode1_2;
  FocusNode get focusNode2 => _focusNode2;
  FocusNode get focusNodeBox => _focusNodeBox;

  TextEditingController get screenTimeContr => screenTimeController;
  TextEditingController get screenTimeContr1 => screenTimeController1;
  TextEditingController get screenTimeContr2 => screenTimeController2;
  TextEditingController get appUseContr => appUseController;
  TextEditingController get textBoxContr => textBoxController;

  var key1 = GlobalKey();

  bool isAnswerd = true;
  int indexNotAnswerd = -1;
  // Other methods and state for your provider...

  void clear() {
    screenTimeController.clear();
    screenTimeContr1.clear();
    screenTimeContr2.clear();
    appUseController.clear();
    textBoxContr.clear();
    lastComplexQuest = -1;
  }

  void setSliderAnswersList(int questionsLength) {
    sliderAnswers = List.filled(questionsLength,
        QuestionAnswers(questionIndex: -1, valueSelected: -1, textAnswer: ''),
        growable: true);
  }

  void setRadioValLastComplex(int val) {
    lastComplexQuest = val;
    notifyListeners();
  }

  Future<void> setValuePickedSlider(
      int valueChosen, int index, String valueText) async {
    // Check if an object with the same id exists
    int existingIndex =
        sliderAnswers.indexWhere((obj) => obj.questionIndex == index);

    if (existingIndex != -1) {
      // Object with the same id exists, update it
      sliderAnswers[existingIndex] = QuestionAnswers(
          questionIndex: index,
          valueSelected: valueChosen,
          textAnswer: valueText);
    } else {
      // Object with the same id doesn't exist, add the new object
      sliderAnswers.add(QuestionAnswers(
          questionIndex: index,
          valueSelected: valueChosen,
          textAnswer: valueText));
    }

    notifyListeners();
  }

  Future<bool> checkControllersAndUpdate(BuildContext context) async {
    setTextControllersScreen(
        screenTimeController1, screenTimeController2, appUseController);

    if (screenTimeController.text.isNotEmpty &&
        appUseController.text.isNotEmpty) {
      doubleTextContainerColor = const Color(0x2C009687);
      await setValuePickedSlider(0, 1,
              'ScreenTime: ${screenTimeController.text}, App: ${appUseController.text}')
          .then((_) async {
        isAnswerd = await setValuePickedSlider(
                lastComplexQuest, 6, 'TextBox: ${textBoxController.text}')
            .then((value) => printQuestionAnswers(context));
      });
      notifyListeners();
      return isAnswerd;
    } else {
      showSnackbar(context, 'Δεν έχετε συμπληρώσει πεδία!!');
      doubleTextContainerColor = Colors.red;
      Scrollable.ensureVisible(
        key1.currentContext!,
        duration: const Duration(milliseconds: 1000),
      );
      notifyListeners();
      isAnswerd = false;
      return isAnswerd;
    }
  }

// clear duplicates
  void _clearFirstInit() {
    sliderAnswers
        .removeWhere((questioAnswer) => questioAnswer.valueSelected == -1);
  }

  Future<bool> printQuestionAnswers(BuildContext context) async {
    final authService = Provider.of<AuthService>(context,
        listen: false); // Access AuthService using Provider
    for (int i = 0; i < sliderAnswers.length; i++) {
      if (kDebugMode) {
        print('${sliderAnswers[i]}');
      }
    }
    // Check if AuthService instance exists
    final user = authService.userSignIn;

    _clearFirstInit();

    // do the checks
    if (sliderAnswers.length >= 7) {
      await DatabaseService(uid: user!.uid).updateUserData(sliderAnswers);
      if (kDebugMode) {
        print('to length einai :  ${sliderAnswers.length}');
      }
      for (int i = 0; i < sliderAnswers.length; i++) {
        if (kDebugMode) {
          print(
              'To index tis erwtiseis einai ${sliderAnswers[i].questionIndex} kai i timi einai : ${sliderAnswers[i].valueSelected} + ${sliderAnswers[i].textAnswer}');
        }
      }
      isAnswerd = true;
      return isAnswerd;
    } else {
      isAnswerd = false;
      showSnackbar(context, 'Δεν έχετε συμπληρώσει πεδία/ερωτήσεις!!');
      return isAnswerd;
    }
  }

  void updateAttedanceCollectionEvent(BuildContext context) async {
    final authService = Provider.of<AuthService>(context,
        listen: false); // Access AuthService using Provider
    DateTime attedance = DateTime.now();
    // ignore: unnecessary_null_comparison
    if (authService != null) {
      // Check if AuthService instance exists
      final user = authService.userSignIn;

      await DatabaseService(uid: user!.uid).upEvent(attedance);
    }
  }

  void setAttedanceCollectionEvent(BuildContext context) async {
    final authService = Provider.of<AuthService>(context,
        listen: false); // Access AuthService using Provider
    DateTime attedance = DateTime.now();
    // ignore: unnecessary_null_comparison
    if (authService != null) {
      // Check if AuthService instance exists
      final user = authService.userSignIn;
      await DatabaseService(uid: user!.uid).setUserEvents(attedance);
    }
  }

  void setTextControllersScreen(TextEditingController screenTimeH,
      TextEditingController screenTimeMin, TextEditingController mostUseApp) {
    screenTimeController.text = '${screenTimeH.text}:${screenTimeMin.text}';
    appUseController.value = mostUseApp.value;
  }

  void setTextBoxController(TextEditingController textBox) {
    textBoxController.value = textBox.value;
  }
}
