//gia to belaki kai to done sthn selida me tis ervthseis

import 'package:flutter/material.dart';
import 'package:livansia_app/providers/questions_provider.dart';

import 'package:provider/provider.dart';

import '../../../global/functions/database_firebase.dart';

bool loading = false;
String thougths = '';
bool scoreCheck = false;

class BottomThoughtBox extends StatefulWidget {
  final int index;
  const BottomThoughtBox({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomThoughtBox> createState() => _BottomThoughtBoxState();
}

class _BottomThoughtBoxState extends State<BottomThoughtBox> {
  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode
        .dispose(); // Dispose of the focus node when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final questionsProvider =
        Provider.of<QuestionsProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TextFormField(
            controller: questionsProvider.textBoxController,
            maxLines: 5,
            // maxLength: 200,
            decoration: InputDecoration(
              label: const Text(
                  'Πές μας δυο λόγια για αυτό: (αν δεν συμμετείχες, ποιος ήταν ο λόγος; σε βοήθησαν τα social media που σε ενημέρωσαν σχετικά;)'),
              labelStyle: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
              hintText:
                  '\t π.χ. έχασα μια συναυλία που πήγαν κάποιοι φίλοι- έμαθα για ένα μαγαζί αλλά είναι ακριβό ',
              hintStyle: const TextStyle(
                fontSize: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(color: Color(0x2C009687), width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: Colors.indigo.shade300, width: 2.0),
              ),
            ),
            keyboardType: TextInputType.multiline,
            //validator: (val) => '',
            //val.length < 30 ? 'Παρακαλώ βάλε μία περιγραφή με 30+ γράμματα.' : '',
            onChanged: (val) =>
                // val.length >= 30
                {
                  setState(() => thougths = val),
                }),
      ],
    );
  }
}



// class BottomThoughtBox extends StatefulWidget {
//   @override
//   _BottomThoughtBoxState createState() => _BottomThoughtBoxState();

  
// }



// class _BottomThoughtBoxState extends State<BottomThoughtBox> {
//   bool _isButtonDisabled = false;
//   Widget build(BuildContext context) {
//     final user = Provider.of<User>(context);

//     // final snackbar = SnackBar(
//     //   content: Text('Δεν έχεις συμπληρώσει το πεδίο με το κείμενο.'),
//     //   action: SnackBarAction(label: 'Ok', onPressed: () => null),
//     // );

//     return StreamBuilder<UserData>(
//       stream: user.uid != null
//           ? DatabaseService(uid: user.uid).userData
//           : AuthScreen(),
//       builder: (context, snapshot) {
//         try {
//           if (snapshot.hasData) {
//             UserData userData = snapshot.data;
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 Align(
//                   alignment: FractionalOffset.bottomLeft,

//                   //child: Card(
//                   //elevation: 1.5,

//                   child: TextFormField(
//                       maxLines: 5,
//                       maxLength: 200,
//                       decoration: InputDecoration(
//                         hintText: '\tΛίγα λόγια για το πώς αισθάνεσαι.',
//                         fillColor: Colors.pink,
//                         border: new OutlineInputBorder(
//                           borderRadius: new BorderRadius.circular(25.0),
//                           borderSide: new BorderSide(
//                             color: Colors.teal[100],
//                           ),
//                         ),
//                       ),
//                       keyboardType: TextInputType.multiline,
//                       //validator: (val) => '',
//                       //val.length < 30 ? 'Παρακαλώ βάλε μία περιγραφή με 30+ γράμματα.' : '',
//                       onChanged: (val) =>
//                           // val.length >= 30
//                           {
//                             setState(() => thougths = val),
//                           }),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: RaisedButton(
//                       elevation: 1.2,
//                       animationDuration: Duration(seconds: 2),
//                       color: Colors.indigo[200],
//                       splashColor: Colors.teal[100],
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                       ),
//                       child: Text('Τέλος'),
//                       onPressed: () async {
//                         setState(() => loading = true);
//                         await DatabaseService(uid: user.uid)
//                             .updateUserDataThougths(
//                           thougths ?? userData.thougths,
//                         );
//                         DateTime timeDay = DateTime.now();
//                         await DatabaseService(uid: user.uid)
//                             .updateUserEvent(timeDay);
//                         Navigator.push(
//                           context,
//                           new MaterialPageRoute(builder: (context) => Finish()),
//                         );
//                       }),
//                 ),
//               ],
//             );
//           } else {
//             return Loading();
//           }
//         } catch (e) {
//           print('lathos');
//         }
//       },
//     );
//   }
// }
