import 'package:livansia_app/helpers/utilities.dart';

class GetAnswers {
  // List questionsAnswer;
  //List parousies;
  // int score;
  List dedomena;
  DateTime input;
  // String thoughts;
  // String am;
  String gender;
  String born;

  GetAnswers({
    // this.questionsAnswer,
    // required this.parousies,
    // required this.score,
    required this.dedomena,
    required this.input,
    // required this.thoughts,
    // required this.am,
    required this.gender,
    required this.born,
  });
}

class Answer {
  late Map<String, dynamic> data; // Assuming the data is stored as a Map
//  late DateTime timestamp; // To store the timestamp

  Answer({
    required this.data,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      data: json,
    );
  }
}
