import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:livansia_app/pages/calendar_screen.dart';
import 'package:livansia_app/pages/welcome_screens/welcome_register.dart';
import 'package:livansia_app/providers/database_firebase.dart';
import 'package:livansia_app/services/authedication_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../global/app_drawer.dart';
import '../../models/users.dart';
import '../../providers/database_questions_firestore.dart';
import '../questions/questionnaire_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
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
  late int selectedOptionJob;
  late int useSocial;
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
                  text: ' μία φορά την ημέρα για διάστημα 7 ημερών.',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                ),
                TextSpan(
                  text: '\nΕυχαριστούμε!',
                )
              ]),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              backgroundColor: Colors.teal[100],
            ),
            child: const Text(
              'Εντάξει',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
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
                  hm,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.radio_button_checked, color: Colors.teal[100]),
                title: Text(
                  gender,
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

    final databaseProvider =
        Provider.of<DatabaseServiceProvider>(context, listen: false);
    authServiceProv.setUserSignIn();
    try {
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
              color: Colors.black87), // Set the desired color for the icon,
          backgroundColor: Colors.teal[100],
          centerTitle: true,
        ),
        drawer: const AppDrawer(),
        body: StreamBuilder<UserData?>(
            stream: DatabaseService(uid: authServiceProv.userSignIn?.uid ?? '')
                .userData,
            builder: (context, snapshot) {
              // ignore: sized_box_for_whitespace
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 60,
                    ),
                    const Image(
                        width: 100,
                        image: AssetImage(
                          "assets/6logo.png",
                        ),
                        fit: BoxFit.cover),
                    const SizedBox(height: 40),
                    Text(
                      'Καλώς Όρισες ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(fontSizeFactor: 1.5),
                    ),
                    const SizedBox(
                      width: 200,
                      child: Center(
                        child: Text(
                          'Συνιστάται καθημερινή καταχώρηση στο τέλος της ημέρας σας.',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        backgroundColor: Colors.teal[100],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Νέα Καταχώρηση',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        await databaseProvider.fetchData();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Questionnaire(),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          backgroundColor: Colors.indigo[200],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Ημερολόγιο Καταχωρήσεων',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          final user = authServiceProv.userSignIn?.uid;
                          if (kDebugMode) {
                            print(DateTime.now());
                          }
                          await databaseProvider
                              .printDocs(user)
                              .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CalendarScreen(),
                                    ),
                                  ));
                        },
                      ),
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
      if (kDebugMode) {
        print(e.toString());
      }
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
                    .updateUserInfo(
                        gender, born!, selectedOptionJob, useSocial);
                // ignore: use_build_context_synchronously
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
        selectedOptionJob = userSignIn.selectedOptionJob;
        useSocial = userSignIn.selectedOptionJob;
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
          builder: (context) => const WelcomeRegister(),
        ),
      );
      return 'ok';
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final datePick = await showDatePicker(
        context: context,
        initialDate: birthDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (datePick != null && datePick != birthDate) {
      setState(() {
        birthDate = datePick;
        isDateSelected = true;
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
