// import 'package:flutter/material.dart';

// import 'package:new_app/models/pickText.dart';

// import 'package:new_app/screens/login_screen.dart';
// import 'package:new_app/models/calculation.dart';
// import 'package:new_app/models/levels.dart';

// import 'package:new_app/models/user.dart';
// import 'package:new_app/models/verify.dart';
// import 'package:new_app/providers/database.dart';
// import 'package:new_app/screens/concluzion_screen.dart';
// import 'package:new_app/screens/wrapper.dart';

// import 'package:provider/provider.dart';

// import '../../../global/functions/database_firebase.dart';

// class Slid extends StatefulWidget {
//   final int index;
//   Slid({this.index});
//   @override
//   State<StatefulWidget> createState() => new SlidState(index: this.index);
// }

// int finalScore = 0;
// int scoreU = 0;
// int counter = 0;
// int megethos = 0;
// String thougths = '';

// List record = [];
// List answerL = [];
// List finaList = [];
// List dedomena = [];
// List fval = [];
// int score = 0;

// List ans0 = [];
// List val0 = [];
// List ans1 = [];
// List val1 = [];
// List ans2 = [];
// List val2 = [];
// List ans3 = [];
// List val3 = [];
// List ans4 = [];
// List val4 = [];
// List ans5 = [];
// List val5 = [];
// List rangeT = [
//   'Δεν έχει επιλεχθεί',
//   'Καθόλου',
//   'Σχετικά',
//   'Αρκετά',
//   'Πάρα Πολύ'
// ];

// class SlidState extends State<Slid> {
//   final int index;
//   SlidState({this.index});

//   bool loading = false;
//   bool pressed = false;
//   final _formKey = GlobalKey<FormState>();
//   int _categoryValue = 1;
//   int counter = 0;
//   int countText = 0;
//   @override
//   Widget build(BuildContext context) {
//     counter = counter + 1;
//     final user = Provider.of<User>(context);
//     //Verify verify = Provider.of<Verify>(context);

//     return StreamBuilder<UserData>(
//       stream: user.uid != null
//           ? DatabaseService(uid: user.uid).userData
//           : AuthScreen(),
//       builder: (context, snapshot) {
//         try {
//           if (snapshot.hasData) {
//             UserData userData = snapshot.data;

//             Verify(verification: false, uid: user.uid);

//             return Container(
//               width: 245,
//               child: Form(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     SliderTheme(
//                       data: SliderTheme.of(context).copyWith(
//                         activeTickMarkColor: Colors.teal[100],
//                       ),
//                       child: Slider.adaptive(
//                         value: (_categoryValue ?? 1).toDouble(),
//                         min: 1,
//                         max: 4,
//                         divisions: 3,
//                         activeColor: Colors.teal[100],
//                         inactiveColor: Colors.blueGrey[600],
//                         label: _categoryValue.toInt().toString(),
//                         onChangeStart: (double nVal) {
//                           print('to nval start einai ${nVal.toInt()}');

//                           countText = nVal.toInt();
//                           PickT(
//                             word: rangeT[countText],
//                           );
//                         },
//                         onChanged: (newValue) {
//                           setState(
//                             () {
//                               _categoryValue = newValue.round();
//                               countText = _categoryValue;
//                               print('to category value $_categoryValue');
//                               // calculate(index, userData, newValue.toInt(), user);
//                             },
//                           );
//                         },
//                         onChangeEnd: (double newValue) {
//                           print('Ended change on $newValue');
//                           keepTheVal(newValue.toInt(), userData, user, index);
//                         },
//                       ),
//                     ),
//                     Level(),
//                     Center(
//                       child: PickT(
//                         word: rangeT[countText],
//                       ),
//                     ),
//                     //SizedBox(height: 3),
//                   ],
//                 ),
//               ),
//             );
//           } else {
//             return Wrapper(apoPou: true);
//           }
//         } catch (e) {
//           print('lathos');
//         }
//       },
//     );
//   }

//   Future<Widget> keepTheVal(
//       int value, UserData userData, User user, int index) async {
//     if (value == 1) {
//       countText = value;
//     }
//     if (index == 0) {
//       ans0.add('Ερώτηση $index : $value');
//       val0.add(value);

//       ///  print('ans0 = $ans0');
//     } else if (index == 1) {
//       ans1.add('Ερώτηση $index : $value');
//       val1.add(value);
//       // print('ans0 = $ans0');
//     } else if (index == 2) {
//       ans2.add('Ερώτηση $index : $value');
//       val2.add(value);
//       // print('ans0 = $ans0');
//     } else if (index == 3) {
//       ans3.add('Ερώτηση $index : $value');
//       val3.add(value);
//       //  print('ans0 = $ans0');
//     } else if (index == 4) {
//       ans4.add('Ερώτηση $index : $value');
//       val4.add(value);
//       //print('ans0 = $ans0');
//     } else if (index == 5) {
//       ans5.add('Ερώτηση $index : $value');
//       val5.add(value);
//       // print('ans0 = $ans0');
//     }
//     megethos = record.length;
//     record.add('Ερώτηση $index');

//     answerL.add(': $fval');

//     print('to finaList length einai $megethos');
//     if (megethos >= 5 && val0 != []) {
//       if (val0 != [] &&
//           val1 != [] &&
//           val2 != [] &&
//           val3 != [] &&
//           val4 != [] &&
//           val5 != []) {
//         print('h lista 0 einai ${val0.last}');
//         fval = [
//           val0.last,
//           val1.last,
//           val2.last,
//           val3.last,
//           val4.last,
//           val5.last
//         ];
//         finaList = [
//           ans0.last,
//           ans1.last,
//           ans2.last,
//           ans3.last,
//           ans4.last,
//           ans5.last
//         ];

//         print('Το counter ειναι $counter');
//         // var check = fval.any((e) => e.contains(0));
//         for (int i = 0; i < finaList.length; i++) {
//           //υπολογισμοσ score
//           // if (check) {
//           //score=calculate(i, userData, 0, user);
//           // } else {
//           score = calculate(i, userData, fval[i], user);
//           // }
//         }
//         Finish().quoteFind(user.uid, score);

//         userData.score = score;
//         print('userData score = ${userData.score}');
//         finaList.add('Το score είναι $score');
//         //dedomena = [finaList,score];
//         print('ta dedomena einai $dedomena');
//         //στελνει στη βαση
//         await DatabaseService(uid: user.uid).updateUserData(
//           finaList ?? userData.dedomena,
//         );

//         DateTime timDay = DateTime.now();
//         await DatabaseService(uid: user.uid).upEvent(timDay);

//         print('egasa edw');

//         finaList = [];
//       }
//     } else if (megethos >= 5 && val0 == []) {
//       print('dhdsfgoyguaprfegrghrE');
//     }
//   }
// }
