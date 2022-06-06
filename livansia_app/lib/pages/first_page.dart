import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:livansia_app/pages/user_consent.dart';

import '../global/animated_logo_container.dart';
import 'authenticate_firebase/sign_in.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  static const routeName = '/auth';

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      //appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: deviceSize.height,
            width: deviceSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //  AnimateLogo(),
                const Image(
                  width: 130,
                  image: AssetImage(
                    "assets/6logo.png",
                  ),
                ),
                const SizedBox(height: 100.0),
                ElevatedButton(
                  //sign_in
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal.shade200, onPrimary: Colors.white),
                  onPressed: () {
                    if (showSignIn) {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    SignIn(toggleView: toggleView),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return child;
                            },
                          ));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 10),
                    child: Text(
                      'Είσοδος',
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline6?.fontSize,
                        color: Theme.of(context).textTheme.headline6?.color,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  //sign_in
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal.shade200, onPrimary: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => Consent(toggleView: toggleView),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 10),
                    child: Text(
                      'Εγγραφή',
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline6?.fontSize,
                        color: Theme.of(context).textTheme.headline6?.color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
