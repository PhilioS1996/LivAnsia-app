import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livansia_app/global/loading.dart';
import 'package:livansia_app/pages/questions/question_tile.dart';
import 'package:livansia_app/pages/questions/questions.dart';
import 'package:livansia_app/pages/questions/widget/bottom_text.dart';
import 'package:provider/provider.dart';

import '../../global/app_drawer.dart';
import '../../global/functions/database_questions_firestore.dart';
import '../../models/get_quest.dart';
import '../../providers/questions_provider.dart';
import '../test_question_page/test_questions.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  //final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);
    final questionsProvider =
        Provider.of<QuestionsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        centerTitle: true,
        title: const Image(
            width: 50,
            image: AssetImage(
              "assets/6logo.png",
            ),
            fit: BoxFit.cover),
        actions: <Widget>[
          IconButton(
            //iconSize: 30,
            icon: const Icon(
              Icons.help_outline,
              color: Colors.black87,
            ),
            onPressed: () async {
              _showInfo(context);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('showQuestions').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData) {
            return const LoadingSpin();
          }
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Μετακίνησε το slider στην βαθμίδα που σε αντιπροσωπεύει.',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .apply(fontSizeFactor: 0.9),
                ),
                const SizedBox(height: 38),

                Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = snapshot.data!.docs[index];
                        final name = document['name'];
                        return QuestionTile(
                          question1: document,
                          index: index,
                        );
                      },
                    )),

                const SizedBox(
                  height: 30,
                ),
                // const BottomThoughtBox(),
              ],
            ),
          );
        },
      ),
      // StreamBuilder<List<GetQuest>>(
      //   stream: DatabaseService2().readQuestions(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       questionsProvider.setSliderAnswersList(
      //         snapshot.data!.length,
      //       );
      //       return Container(
      //         padding: const EdgeInsets.fromLTRB(5, 45, 10, 5),
      //         child: Form(
      //           key: _formKey,
      //           child: Column(
      //             children: <Widget>[
      //               Text(
      //                 'Μετακίνησε το slider στην βαθμίδα που σε αντιπροσωπεύει.',
      //                 style: Theme.of(context)
      //                     .textTheme
      //                     .headline6!
      //                     .apply(fontSizeFactor: 0.9),
      //               ),
      //               const SizedBox(height: 38),
      //               const Expanded(
      //                   // ignore: sized_box_for_whitespace
      //                   child: TestPage()
      //                   // Container(
      //                   //   height: MediaQuery.of(context).size.height,
      //                   //   child: ListView.builder(
      //                   //     itemCount: snapshot.data!.length,
      //                   //     itemBuilder: (context, index) {
      //                   //       return QuestionTile(
      //                   //         question1: snapshot.data![index],
      //                   //         index: index,
      //                   //       );
      //                   //     },
      //                   //   ),
      //                   // ),
      //                   ),
      //               const SizedBox(
      //                 height: 30,
      //               ),
      //               // const BottomThoughtBox(),
      //             ],
      //           ),
      //         ),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Text('Κάτι πήγε λάθος ${snapshot.error}');
      //     } else {
      //       return const LoadingSpin();
      //     }
      //   },
      // ),
    );
  }
}

void _showInfo(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text(
        'Info',
        style: TextStyle(),
      ),
      content: RichText(
        text: const TextSpan(
            text:
                'Παρακαλούμε απαντήστε στο ερωτηματολόγιο με ειλικρίνεια, για πιο ακριβή αποτελέσματα και',
            style: TextStyle(color: Colors.black, fontSize: 18),
            children: <TextSpan>[
              TextSpan(
                text: ' τουλάχιστον μία φορά την ημέρα.\n',
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
              ),
              TextSpan(
                text:
                    '\nΥποσημείωση: για την επιλογή "Καθόλου" χρειάζεται να μετακινηθεί το slider αρχικά μπροστά και έπειτα σε αυτή τη βαθμίδα.',
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            ]),
      ),
      actions: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.indigo[200],
            borderRadius: BorderRadius.circular(18),
          ),
          child: ElevatedButton(
            child: const Text('Εντάξει'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        )
      ],
    ),
  );
}
