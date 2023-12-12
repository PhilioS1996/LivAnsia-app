import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
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
  final ageTextController = TextEditingController();
  bool _isButtonDisGen = true;
  //bool _isButtonDisAm = true;
  Gender selectedGender = Gender.Female;
  String _selectedDate = 'Πάτα για επιλογή';
  int selectedOptionJob = 0;
  String? genderType = '';

  int _radioValue1 = -1;
  // int _radioValue2 = -1;

  bool allCheck() {
    bool res = false;
    if (!_isButtonDisCal && !_isButtonDisGen) {
      //if (!_isButtonDisGen) {
      res = true;
      // print('to res einai $res');
      return res;
      //}
    } else {
      // print('to res einai $res');
      return res;
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    ageTextController.dispose();
    super.dispose();
  }

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
                    .headlineSmall!
                    .apply(fontSizeFactor: 1.4),
              ),
              const SizedBox(height: 15),
              Text('Πρίν Ξεκινήσεις Συμπλήρωσε τα Πεδία: ',
                  style: Theme.of(context).textTheme.bodyLarge
                  //.apply(fontSizeFactor: 1.5),
                  ),
              const SizedBox(height: 50),
              Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color.fromARGB(
                        45, 0, 150, 135), // Defines the color of the border
                    width: 2.0, // Defines the width of the border
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                // color: Colors.grey[300],
                elevation: 3,
                child: Container(
                  width: 350,
                  // height: 190,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    // border: Border.all(
                    //   color: Colors.teal.shade100,
                    //   width: 2,
                    // ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // const SizedBox(height: 9),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              const Text(
                                'Ηλικία:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // const SizedBox(width: 10),
                              Container(
                                width: 140,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.indigo.shade100,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: TextField(
                                  controller: ageTextController,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: SizedBox(
                            width: 310,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio<int>(
                                  value: 1,
                                  groupValue: selectedOptionJob,
                                  activeColor: Colors.indigo.shade400,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOptionJob = value!;
                                    });
                                  },
                                ),
                                Text('Option 1'),
                                Radio<int>(
                                  value: 2,
                                  groupValue: selectedOptionJob,
                                  activeColor: Colors.indigo.shade400,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOptionJob = value!;
                                    });
                                  },
                                ),
                                Text('Option 2'),
                                Radio<int>(
                                  value: 3,
                                  groupValue: selectedOptionJob,
                                  activeColor: Colors.indigo.shade400,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOptionJob = value!;
                                    });
                                  },
                                ),
                                Text('Option 3'),
                              ],
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Φύλο:',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 140,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 320,
                                child: GenderPickerWithImage(
                                  showOtherGender: true,
                                  verticalAlignedText: false,
                                  selectedGender: selectedGender,
                                  selectedGenderTextStyle: const TextStyle(
                                      color: Color(0xFF8b32a8),
                                      fontWeight: FontWeight.bold),
                                  unSelectedGenderTextStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                  onChanged: (gender) {
                                    if (kDebugMode) {
                                      print('---------${gender?.name}');
                                      setState(() {
                                        genderType = gender?.name;
                                        selectedGender = gender!;
                                        _isButtonDisGen = false;
                                      });
                                    }
                                  },
                                  equallyAligned: true,
                                  animationDuration:
                                      Duration(milliseconds: 300),
                                  isCircular: true,
                                  // default : true,
                                  opacityOfGradient: 0.4,
                                  padding: const EdgeInsets.all(3),
                                  size: 50, //default : 40
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20),
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Χρησιμοποιείς κάποιο/α ενεργά?',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/facebook-svg.svg',
                                      semanticsLabel: 'Your SVG Image',
                                      width: 25,
                                      height: 25,
                                    ),
                                    SvgPicture.asset(
                                      'assets/x-social-media-black-icon.svg',
                                      semanticsLabel: 'Your SVG Image',
                                      width: 25,
                                      height: 25,
                                    ),
                                    SvgPicture.asset(
                                      'assets/instagram-svg.svg',
                                      semanticsLabel: 'Your SVG Image',
                                      width: 25,
                                      height: 25,
                                    ),
                                    SvgPicture.asset(
                                      'assets/linkedin-svg.svg',
                                      semanticsLabel: 'Your SVG Image',
                                      width: 25,
                                      height: 25,
                                    ),
                                    SvgPicture.asset(
                                      'assets/tiktok-svg.svg',
                                      semanticsLabel: 'Your SVG Image',
                                      width: 25,
                                      height: 25,
                                    ),
                                    SvgPicture.asset(
                                      'assets/youtube-svg.svg',
                                      semanticsLabel: 'Your SVG Image',
                                      width: 25,
                                      height: 25,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 1,
                                        groupValue: selectedOptionJob,
                                        activeColor: Colors.indigo.shade400,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedOptionJob = value!;
                                          });
                                        },
                                      ),
                                      const Text('Ναί'),
                                      Radio<int>(
                                        value: 0,
                                        groupValue: selectedOptionJob,
                                        activeColor: Colors.indigo.shade400,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedOptionJob = value!;
                                          });
                                        },
                                      ),
                                      const Text('Όχι'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  backgroundColor: Colors.teal[100],
                ),
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
                child: Container(
                  width: 310,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: const Text(
                    'Έναρξη',
                    textAlign: TextAlign.center,
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

  // Future<void> _selectDate(BuildContext context) async {
  //   final datePick = await showDatePicker(
  //       // theme: ThemeData(
  //       //   primaryColor: Colors.teal[100],
  //       //   //  accentColor: Colors.indigo[100],
  //       // ),
  //       context: context,
  //       initialDate: birthDate,
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime.now());
  //   if (datePick != null) {
  //     // && datePick != birthDate
  //     setState(() {
  //       birthDate = datePick;
  //       isDateSelected = true;
  //       setState(() => _isButtonDisCal = false);
  //       // put it here
  //       born =
  //           "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019
  //       _selectedDate = born;
  //     });
  //   }
  // }
}

//var newDateTime = DateTime.utc(null);
late String born;
String initValue = "Select your Birth Date";
bool isDateSelected = false;
DateTime birthDate = DateTime.now();
