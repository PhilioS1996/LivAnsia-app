import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livansia_app/pages/welcome_screens/welcome_register.dart';
import 'package:livansia_app/providers/user_provider.dart';
import 'package:livansia_app/services/authedication_service.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../global/app_drawer.dart';
import '../../global/functions/database_firebase.dart';
import '../../global/loading.dart';
import '../../models/users.dart';
import '../questions/questionnaire_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  final _formKey = GlobalKey<FormState>();
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  // late User user1;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    // user1 = _auth.currentUser!;
    setState(() {});
  }

  bool _isButtonDisAm = true;
  bool eimaiRegister = false;
  late String hm;
  late String gender;
  String _selectedDate = 'Πάτα για επιλογή';

  void _showInfo() {
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
                  text: ' τουλάχιστον μία φορά την ημέρα.',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                ),
                TextSpan(
                  text: '\nΕυχαριστούμε!',
                )
              ]),
        ),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: Colors.indigo[200],
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

  void _showUserD(User userSignIn) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Προφίλ',
          style: TextStyle(),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                leading:
                    Icon(Icons.radio_button_checked, color: Colors.teal[100]),
                title: Text(
                  '${userSignIn.email}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.radio_button_checked,
                  color: Colors.teal[100],
                ),
                title: Text(
                  '$hm',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.radio_button_checked, color: Colors.teal[100]),
                title: Text(
                  '$gender',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: Colors.indigo[200],
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

  @override
  Widget build(BuildContext context) {
    final authServiceProv = Provider.of<AuthService>(context, listen: true);
    authServiceProv.setUserSignIn();
    try {
      // return StreamBuilder<User>(
      //   stream:
      //       DatabaseService(uid: authServiceProv.userInstance!.uid).userData,
      //   // user.uid != null
      //   //     ? DatabaseService(uid: user.uid).userData
      //   //     : AuthScreen(),
      //   builder: (context, snapshot) {
      //     UserData? userData = snapshot.data;

      // if (snapshot.hasData) {
      //  _che();
      return Scaffold(
        // backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.teal[100],
          centerTitle: true,
          title: const Image(
              width: 50,
              image: AssetImage(
                "assets/6logo.png",
              ),
              fit: BoxFit.cover),
        ),
        drawer: AppDrawer(),
        body: StreamBuilder<UserData?>(
            stream:
                DatabaseService(uid: authServiceProv.userSignIn!.uid).userData,
            builder: (context, snapshot) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 126,
                    ),
                    Text(
                      'Καλώς Όρισες ',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .apply(fontSizeFactor: 1.5),
                    ),
                    Container(
                      width: 200,
                      child: const Center(
                        child: Text(
                          'Συνιστάται καθημερινή καταχώρηση.',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.error_outline,
                      ),
                      onPressed: () => showTextField(
                          snapshot.data, authServiceProv.userSignIn!),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey[300], onPrimary: Colors.white),
                      icon: const Icon(Icons.calendar_today),
                      label: const Text('Ημερολόγιο Καταχώρησης'),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   new MaterialPageRoute(
                        //     builder: (context) => Calendar(user: (user.uid)),
                        //   ),
                        // );
                      },
                    ),
                    const SizedBox(height: 5.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal[100],
                      ),
                      child: const Text(
                        'Νέα Καταχώρηση',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Questionnaire()),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'help',
                          style: TextStyle(fontSize: 15),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            iconSize: 27,
                            icon: const Icon(
                              Icons.help_outline,
                              color: Colors.black87,
                            ),
                            onPressed: () async {
                              _showInfo();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      );
      // } else {
      //   return LoagingSpin();
      // }
      // },
      //);
    } catch (e) {
      print(e.toString());
      return Container();
    }
  }

  void showErrorD(AuthService authServiceProv) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Error',
          style: TextStyle(),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RichText(
                text: const TextSpan(
                  text:
                      'Δεν έγινε σωστή καταγραφή των στοιχείων σου. Επανέλαβε την διαδικασία.',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.indigo.shade100,
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                        _selectedDate,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today),
                      tooltip: 'Ημερομηνία Γέννησης',
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.indigo.shade100,
                      width: 2,
                    ),
                  ),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'Φύλο(Άνδρας/Γυναίκα)',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (val) =>
                      val!.isEmpty ? 'Καταχώρησε το φύλο.' : null,
                  onChanged: (val) {
                    setState(() => gender = val);
                  },
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: Colors.indigo[200],
            ),
            child: ElevatedButton(
              child: const Text('Εντάξει'),
              onPressed: () async {
                await DatabaseService(uid: authServiceProv.userInstance!.uid)
                    .updateUserInfo(gender, born!);
                Navigator.of(ctx).pop();
              },
            ),
          )
        ],
      ),
    );
  }

  String showTextField(var userSignIn, User userFirebase) {
    if (userSignIn != null) {
      if (userSignIn!.born != null && userSignIn.gender != null) {
        setState(() {
          _isButtonDisAm = !_isButtonDisAm;
        });
        gender = userSignIn.gender!;
        hm = userSignIn.born!;
        _showUserD(userFirebase);
        return userSignIn.born!;
      } else {
        setState(() {
          _isButtonDisAm = !_isButtonDisAm;
        });
        //  _showErrorD();
        return 'Ημερομηνία Γέννησης';
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeRegister(),
        ),
      );
      return 'ok';
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final datePick = await showDatePicker(
        // theme: ThemeData(
        //   primaryColor: Colors.teal[100],
        // ),
        context: context,
        initialDate: birthDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (datePick != null && datePick != birthDate) {
      setState(() {
        birthDate = datePick;
        isDateSelected = true;
        //setState(() => _isButtonDisCal = false);
        // put it here
        born =
            "${birthDate!.month}/${birthDate!.day}/${birthDate!.year}"; // 08/14/2019
        _selectedDate = born!;
      });
    }
  }
}

// var newDateTime = DateTime.utc();
String? born;
String initValue = "Select your Birth Date";
bool isDateSelected = false;
DateTime? birthDate;
