import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livansia_app/pages/questions/widget/iconButtonWidget.dart';
import 'package:livansia_app/pages/questions/widget/twoTextBoxWidget.dart';
import 'package:livansia_app/pages/questions/widget/yesNoWidget.dart';

import 'widget/textBoxWidget.dart';

class QuestionTile extends StatelessWidget {
  const QuestionTile({Key? key, required this.question1, required this.index})
      : super(key: key);
  final QueryDocumentSnapshot<Object?> question1;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ListTile(
                contentPadding: const EdgeInsets.only(
                  left: 15,
                  // bottom: 27,
                ),
                title: Text(
                  question1['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // ),
              answerTypeWidget(index),
              const SizedBox(
                height: 20.0,
              ),
            ],
          )),
    );
  }
}

Widget answerTypeWidget(int indexQuestion) {
  if (indexQuestion == 0 || indexQuestion == 3 || indexQuestion == 4) {
    return YesNoWidget(index: indexQuestion);
  } else if (indexQuestion == 2 || indexQuestion == 5) {
    return IconButtonWidget(index: indexQuestion);
  } else if (indexQuestion == 6) {
    return TextBoxWidget(index: indexQuestion);
  } else {
    return TwoTextBoxWidget(index: indexQuestion);
  }
}
