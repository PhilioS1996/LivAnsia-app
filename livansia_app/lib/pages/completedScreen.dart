import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:livansia_app/global/app_drawer.dart';
import 'package:livansia_app/global/loading.dart';
import 'package:livansia_app/helpers/imports.dart';
import 'package:livansia_app/models/getQuote.dart';
import 'package:livansia_app/pages/questions/widget/quotes_tile.dart';
import 'package:livansia_app/pages/welcome_screens/welcome_screen.dart';

import '../global/functions/database_questions_firestore.dart';
import '../providers/questions_provider.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  int getRandomInt(int max) {
    if (max <= 0) {
      throw ArgumentError('Maximum value must be greater than 0');
    }

    Random random = Random();
    return random.nextInt(max);
  }

  @override
  Widget build(BuildContext context) {
    final databaseProvider =
        Provider.of<DatabaseServiceProvider>(context, listen: false);
    final questionsProvider =
        Provider.of<QuestionsProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        // Return false to block the back navigation
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
                color: Colors.black87), // Set the desired color for the icon,
            backgroundColor: Colors.teal[100],
          ),
          drawer: AppDrawer(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                const Image(
                    width: 100,
                    image: AssetImage(
                      "assets/6logo.png",
                    ),
                    fit: BoxFit.cover),
                const SizedBox(height: 40),
                Text(
                  'Eπιτυχής Καταχώρηση',
                  style: Theme.of(context).textTheme.titleLarge?.apply(
                        fontSizeFactor: 1.1,
                      ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Text(
                      'Ευχαριστούμε για την συμμετοχή και σε περιμένουμε αύριο για την επόμενη!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10.0),
                    child: QuotesTile(
                      quo: databaseProvider.listQuotes![
                          getRandomInt(databaseProvider.listQuotes!.length)],
                    )
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //     side: const BorderSide(
                    //       color: Color.fromARGB(
                    //           45, 0, 150, 135), // Defines the color of the border
                    //       width: 2.0, // Defines the width of the border
                    //     ),
                    //     borderRadius: BorderRadius.circular(20.0),
                    //   ),
                    //   color: Theme.of(context).cardColor,
                    //   elevation: 2,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: <Widget>[
                    //       //Text('${quo.text[rng]}'),
                    //       ListTile(
                    //         title: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Text(
                    //             //'ti leei rre mpagasa',
                    //             ,
                    //             style: const TextStyle(
                    //               fontSize: 18,
                    //               fontStyle: FontStyle.italic,
                    //               fontWeight: FontWeight.w300,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    backgroundColor: Colors.indigo.shade300,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 10,
                        vertical: 8),
                    child: const Icon(Icons.home),
                  ),
                  onPressed: () async {
                    questionsProvider.dispose();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                  },
                )
              ],
            ),
          )),
    );
  }

// class _CompletedScreenState extends State<CompletedScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final questionsProvider =
//         Provider.of<QuestionsProvider>(context, listen: false);
//     return
//     StreamProvider<List<GetQuotes>>.value(
//       initialData: [],
//       value: DatabaseService2().quotes3,
//       child:
//       Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.teal[100],
//           // brightness: Brightness.light,
//           centerTitle: true,
//           title: const Image(
//               width: 50,
//               image: AssetImage(
//                 "assets/6logo.png",
//               ),
//               fit: BoxFit.cover),
//         ),
//         drawer: AppDrawer(),
//         body: Column(
//           children: <Widget>[
//             SizedBox(height: 100),
//             Text(
//               'Eπιτυχής Καταχώρηση',
//               style: Theme.of(context).textTheme.titleLarge?.apply(
//                     fontSizeFactor: 1.1,
//                   ),
//             ),
//             SizedBox(height: 12),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   'Ευχαριστούμε για την συμμετοχή και σε περιμένουμε αύριο για την επόμενη!',
//                   style: TextStyle(
//                     fontSize: 15,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),
//             Column(
//       children: <Widget>[
//         for (int i = 0; i < quote.length; i++)
//           QuotesTile(
//             quo: quote[i],
//           ),
//         SizedBox(
//           height: 15,
//         ),
//       ],
//     );
//             // Quote(),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18.0),
//                 ),
//                 backgroundColor: Colors.teal[100],
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: MediaQuery.of(context).size.width / 3.5,
//                     vertical: 8),
//                 child: const Icon(Icons.home),
//               ),
//               onPressed: () async {
//                 questionsProvider.dispose();
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => WelcomeScreen()));
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
}
