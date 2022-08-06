import 'package:flutter/material.dart';
import 'package:livansia_app/models/get_quest.dart';
import 'package:livansia_app/pages/questions/widget/slider_widget.dart';

//ftixnv pws thelw na emfanizontai oi erwthsei
class QuestionTile extends StatelessWidget {
  final GetQuest question1;
  int index;

  QuestionTile({required this.question1, required this.index});

  @override
  Widget build(BuildContext context) {
    // print(index);
    return Scrollbar(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
          child: Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(
                          left: 15,
                          bottom: 27,
                        ),
                        title: Text(
                          question1.name,
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
                    ),
                    SliderWidget(index: index),
                  ],
                ),
                // ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          )),
    );
  }
}
