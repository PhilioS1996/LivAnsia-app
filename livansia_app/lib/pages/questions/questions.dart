import 'package:flutter/cupertino.dart';
import 'package:livansia_app/global/functions/database_questions_firestore.dart';
import 'package:livansia_app/pages/questions/question_tile.dart';
import 'package:livansia_app/pages/questions/widget/bottom_text.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

//List<Questions> _items = []

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  late PageController controller;
  int currentpage = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final databaseQuestionProvider =
        Provider.of<DatabaseService2>(context, listen: true);

    return SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(5, 45, 10, 5),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        'Μετακίνησε το slider στην βαθμίδα που σε αντιπροσωπεύει.',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .apply(fontSizeFactor: 0.9),
                      ),
                    ),
                    const SizedBox(height: 38),
                    SingleChildScrollView(
                        child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount:
                              databaseQuestionProvider.listQuestions!.length,
                          itemBuilder: (context, index) {
                            return QuestionTile(
                              question1: databaseQuestionProvider
                                  .listQuestions![index],
                              index: index,
                            );
                          }),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            );
          }),
    ));

    // StreamProvider<List<GetAnswers>>.value(
    //   value: DatabaseService().answers,
    // child: ListView.builder(
    //     itemCount: 1,
    //     itemBuilder: (context, index) {
    //       return SingleChildScrollView(
    //         child: Container(
    //           padding: EdgeInsets.fromLTRB(5, 45, 10, 5),
    //           child: Form(
    //             key: _formKey,
    //             child: Column(
    //               children: <Widget>[
    //                 Text(
    //                   'Μετακίνησε το slider στην βαθμίδα που σε αντιπροσωπεύει.',
    //                   style: Theme.of(context)
    //                       .textTheme
    //                       .headline6
    //                       .apply(fontSizeFactor: 0.9),
    //                 ),
    //                 SizedBox(height: 30),
    //                 SizedBox(height: 8),
    //                 for (int i = 0; i < question.length; i++)
    //                   QuestionTile(
    //                     question1: question[i],
    //                     index: i,
    //                   ),
    //                 SizedBox(
    //                   height: 30,
    //                 ),
    //                 BottomIcon(),
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     }),
    // );
  }
}
