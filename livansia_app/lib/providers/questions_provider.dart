import 'package:livansia_app/helpers/imports.dart';

class QuestionsProvider with ChangeNotifier {
  List<int> sliderAnswers = [];

  void setSliderAnswersList(int questionsLength) {
    sliderAnswers = List.filled(questionsLength, 0);
  }

  void setValuePickedSlider(int valueSlider, int index) {
    sliderAnswers[index] = valueSlider;
    notifyListeners();
  }
}
