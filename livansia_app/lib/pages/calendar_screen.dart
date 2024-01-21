// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:livansia_app/global/functions/database_firebase.dart';
// import 'package:livansia_app/models/getAnswers.dart';
// import 'package:livansia_app/models/users.dart';
// import 'package:livansia_app/pages/welcome_screens/welcome_screen.dart';
// import 'package:livansia_app/services/authedication_service.dart';

// import 'package:provider/provider.dart';

// class Calendar extends StatefulWidget {
//   final String user;
//   Calendar({
//     Key? key,
//     required this.user,
//   }) : super(key: key);

//   @override
//   _CalendarState createState() => _CalendarState();
// }

// class _CalendarState extends State<Calendar> {
//   final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     final authServiceProv = Provider.of<AuthService>(context, listen: true);

//     final user = Provider.of<User>(context);
//     print('o USER EINAI ${widget.user}');

//     try {
//       return StreamBuilder<UserData?>(
//           stream: DatabaseService(uid: authServiceProv.userSignIn?.uid ?? '')
//               .userData,
//           builder: (context, snapshot) {
//             return StreamProvider<List<GetAnswers>>.value(
//               initialData: [],
//               value: DatabaseService().answers,
//               child: Scaffold(
//                 backgroundColor: Colors.blue[50],
//                 appBar: AppBar(
//                   backgroundColor: Colors.teal[100],
//                   centerTitle: true,
//                   title: const Text(
//                     'Ημερολόγιο Καραχώρησης',
//                     style: TextStyle(
//                       fontStyle: FontStyle.italic,
//                       fontSize: 15,
//                     ),
//                   ),
//                   actions: <Widget>[
//                     IconButton(
//                       icon: const Icon(
//                         Icons.home,
//                         color: Colors.black87,
//                       ),
//                       onPressed: () async {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const WelcomeScreen()));
//                       },
//                     )
//                   ],
//                   systemOverlayStyle: SystemUiOverlayStyle.dark,
//                 ),
//                 //drawer: AppDrawer(),
//                 // body: MakeCal(),
//               ),
//             );
//           });
//     } catch (e) {
//       // return AuthScreen();
//     }
//   }
// }
