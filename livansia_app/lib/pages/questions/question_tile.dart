import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livansia_app/models/get_quest.dart';
import 'package:livansia_app/pages/questions/widget/slider_widget.dart';

class QuestionTile extends StatelessWidget {
  const QuestionTile({Key? key, required this.question1, required this.index})
      : super(key: key);
  final QueryDocumentSnapshot<Object?> question1;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Container(
              //   width: 500,
              //   height: 99,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.teal.shade100,
              //       width: 1,
              //     ),
              //     color: Colors.white38,
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child:
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              // Expanded(
              //   child:
              ListTile(
                contentPadding: const EdgeInsets.only(
                  left: 15,
                  // bottom: 27,
                ),
                title: Text(
                  question1['name'],
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  print('ekana tap');
                },
              ),
              // ),
              SliderWidget(index: index),
              //   ],
              // ),
              // ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          )),
    );
  }
}
