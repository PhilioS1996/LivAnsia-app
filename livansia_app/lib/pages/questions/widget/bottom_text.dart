//gia to belaki kai to done sthn selida me tis ervthseis

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../global/functions/database_firebase.dart';

bool loading = false;
String thougths = '';
bool scoreCheck = false;

class BottomThoughtBox extends StatefulWidget {
  const BottomThoughtBox({Key? key}) : super(key: key);

  @override
  State<BottomThoughtBox> createState() => _BottomThoughtBoxState();
}

class _BottomThoughtBoxState extends State<BottomThoughtBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Align(
          alignment: FractionalOffset.bottomLeft,

          //child: Card(
          //elevation: 1.5,

          child: TextFormField(
              maxLines: 5,
              maxLength: 200,
              decoration: InputDecoration(
                hintText: '\tΛίγα λόγια για το πώς αισθάνεσαι.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.teal.shade100,
                  ),
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
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
              //sign_in
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo[200], onPrimary: Colors.white),

              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(18.0),
              // ),
              child: const Text('Τέλος'),
              onPressed: () async {
                // setState(() => loading = true);
                // await DatabaseService(uid: user.uid).updateUserDataThougths(
                //   thougths ?? userData.thougths,
                // );
                // DateTime timeDay = DateTime.now();
                // await DatabaseService(uid: user.uid).updateUserEvent(timeDay);
                // Navigator.push(
                //   context,
                //   new MaterialPageRoute(builder: (context) => Finish()),
                // );
              }),
        ),
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
