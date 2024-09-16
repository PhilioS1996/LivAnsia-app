import 'package:livansia_app/helpers/utilities.dart';

class GetAnswers {
  List dedomena;
  DateTime input;
  String gender;
  String born;

  GetAnswers({
    required this.dedomena,
    required this.input,
    required this.gender,
    required this.born,
  });
}

class Answer {
  late Map<String, dynamic> data; //the data is stored as a Map
  Answer({
    required this.data,
  });
  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      data: json,
    );
  }
}
