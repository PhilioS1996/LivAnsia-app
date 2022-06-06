import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

import 'package:livansia_app/global/loading.dart';
import 'package:livansia_app/pages/first_page.dart';
import 'package:livansia_app/pages/welcome_screens/welcome_screen.dart';
import 'package:livansia_app/services/authedication_service.dart';

import 'package:provider/provider.dart';

import '../../global/app_drawer.dart';
import '../../global/functions/database_firebase.dart';
import '../../models/users.dart';

bool _isButtonDisCal = true;

class WelcomeRegister extends StatefulWidget {
  @override
  _WelcomeRegisterState createState() => _WelcomeRegisterState();
}

class _WelcomeRegisterState extends State<WelcomeRegister> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool _isButtonDisGen = true;
  //bool _isButtonDisAm = true;

  String _selectedDate = 'Πάτα για επιλογή';

  String? genderType = '';
  //Gender genos;
  int _radioValue1 = -1;
  // int _radioValue2 = -1;

  bool allCheck() {
    bool res = false;
    if (!_isButtonDisCal && !_isButtonDisGen) {
      //if (!_isButtonDisGen) {
      res = true;
      print('to res einai $res');
      return res;
      //}
    } else {
      print('to res einai $res');
      return res;
    }
  }

  // void _handleradiobutton1(int value) {
  //   setState(() => _isButtonDisGen = false);
  //   setState(() {
  //     _radioValue1 = value;
  //     switch (_radioValue1) {
  //       case 0:
  //         genderType = 'Άνδρας';

  //         break;
  //       case 1:
  //         genderType = 'Γυναίκα';
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final authServiceProv = Provider.of<AuthService>(context, listen: true);
    //authServiceProv.setUserSignIn();

    // return
    // StreamBuilder<UserData?>(
    //   stream: DatabaseService(uid: authServiceProv.userSignIn!.uid).userData,
    //   // userProvider.userInstance?.uid != null
    //   //     ? DatabaseService(uid: userProvider.userInstance!.uid).userData
    //   //     : AuthScreen(),
    //   builder: (context, snapshot) {
    //     UserData? userData = snapshot.data;

    //     if (snapshot.hasData) {
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
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 80),
              Text(
                'Καλώς Όρισες ',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .apply(fontSizeFactor: 1.4),
              ),
              const SizedBox(height: 15),
              Text('Πρίν Ξεκινήσεις Συμπλήρωσε τα Πεδία: ',
                  style: Theme.of(context).textTheme.bodyText1
                  //.apply(fontSizeFactor: 1.5),
                  ),
              const SizedBox(height: 50),
              Container(
                width: 300,
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  border: Border.all(
                    color: Colors.teal.shade100,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 9),
                      Row(
                        children: const <Widget>[
                          SizedBox(
                            width: 23,
                          ),
                          Text(
                            'Ημερομηνία Γεννησης:',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
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
                              tooltip: 'Πάτα για επιλογή',
                              onPressed: () {
                                _selectDate(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GenderPickerWithImage(
                        showOtherGender: true,
                        verticalAlignedText: false,
                        selectedGender: Gender.Female,
                        selectedGenderTextStyle: const TextStyle(
                            color: Color(0xFF8b32a8),
                            fontWeight: FontWeight.bold),
                        unSelectedGenderTextStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal),
                        onChanged: (gender) {
                          if (kDebugMode) {
                            print('---------${gender?.name}');
                            setState(() {
                              genderType = gender?.name;
                              _isButtonDisGen = false;
                            });
                          }
                        },
                        equallyAligned: true,
                        animationDuration: Duration(milliseconds: 300),
                        isCircular: true,
                        // default : true,
                        opacityOfGradient: 0.4,
                        padding: const EdgeInsets.all(3),
                        size: 50, //default : 40
                      )
                      // Row(
                      //   children:const <Widget>[
                      //     SizedBox(
                      //       width: 25,
                      //     ),
                      //     Text(
                      //       'Φύλο:',
                      //       style: TextStyle(
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Radio(
                      //       activeColor: Colors.teal[100],
                      //       value: 0,
                      //       groupValue: _radioValue1,
                      //       onChanged: _handleradiobutton1,
                      //     ),
                      //   const  Text(
                      //       'Άνδρας',
                      //       style: TextStyle(
                      //         fontSize: 15,
                      //       ),
                      //     ),
                      //     Radio(
                      //       activeColor: Colors.teal[100],
                      //       value: 1,
                      //       groupValue: _radioValue1,
                      //       onChanged: _handleradiobutton1,
                      //     ),
                      //  const   Text(
                      //       'Γυναίκα',
                      //       style: TextStyle(
                      //         fontSize: 15,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.teal[100],
                ),
                child: ElevatedButton(
                  onPressed: !allCheck()
                      ? null
                      : () async {
                          await DatabaseService(
                                  uid: authServiceProv.userSignIn!.uid)
                              .updateUserInfo(genderType!, born);

                          // Navigator.push(
                          //   context,
                          //   new MaterialPageRoute(
                          //       builder: (context) =>  Questionnaire()),
                          // );
                          // ignore: use_build_context_synchronously
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()),
                          );
                        },
                  child: const Text(
                    'Έναρξη',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //     } else {
    //       return LoagingSpin();
    //     }
    //   },
    // );
  }

  Future<void> _selectDate(BuildContext context) async {
    final datePick = await showDatePicker(
        // theme: ThemeData(
        //   primaryColor: Colors.teal[100],
        //   //  accentColor: Colors.indigo[100],
        // ),
        context: context,
        initialDate: birthDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (datePick != null) {
      // && datePick != birthDate
      setState(() {
        birthDate = datePick;
        isDateSelected = true;
        setState(() => _isButtonDisCal = false);
        // put it here
        born =
            "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019
        _selectedDate = born;
      });
    }
  }
}

//var newDateTime = DateTime.utc(null);
late String born;
String initValue = "Select your Birth Date";
bool isDateSelected = false;
DateTime birthDate = DateTime.now();