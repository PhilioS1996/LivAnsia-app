import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livansia_app/global/loading.dart';
import 'package:livansia_app/pages/completed_screen.dart';
import 'package:livansia_app/pages/questions/question_tile.dart';
import 'package:livansia_app/providers/database_questions_firestore.dart';
import 'package:provider/provider.dart';
import '../../global/app_drawer.dart';
import '../../providers/questions_provider.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);
    final questionsProvider =
        Provider.of<QuestionsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.black87), // Set the desired color for the icon,
        backgroundColor: Colors.teal[100],
        title: const Text('Ερωτήσεις',
            textAlign: TextAlign.left, style: TextStyle(color: Colors.black87)),
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
      drawer: const AppDrawer(),
      body: GestureDetector(
        onTap: () {
          questionsProvider.focusNode1.unfocus();
          questionsProvider.focusNode2.unfocus();
          questionsProvider.focusNodeBox.unfocus();
        },
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('showQuestions')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData) {
              return const LoadingSpin();
            }
            questionsProvider.setSliderAnswersList(snapshot.data!.docs.length);
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: <Widget>[
                  // const Padding(
                  //   padding: EdgeInsets.only(bottom: 10),
                  //   child: Text(
                  //     'Μετακίνησε το slider στην βαθμίδα που σε αντιπροσωπεύει.',
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //       color: Colors.black87,
                  //     ),
                  //     //textAlign: TextAlign.center,
                  //   ),
                  // ),
                  // Divider(
                  //   color: Colors.grey[300],
                  // ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final document = snapshot.data!.docs[index];
                      // final name = document['name'];
                      return QuestionTile(
                        question1: document,
                        index: index,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      backgroundColor: Colors.teal[100],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 3.5,
                          vertical: 8),
                      child: const Text(
                        'Υποβολή',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      // questionsProvider.updateAttedanceCollectionEvent(context);

                      await questionsProvider
                          .checkControllersAndUpdate(context)
                          .then((value) {
                        if (value) {
                          questionsProvider.clear();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CompletedScreen()));
                        }
                      });
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
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
                text: ' κατα προτίμηση στο τέλος της ημέρας σας.\n',
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
              ),
            ]),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo[300],
          ),
          child: const Text(
            'Εντάξει',
            // style: TextStyle(color: Colors.black87),
          ),
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        )
      ],
    ),
  );
}
