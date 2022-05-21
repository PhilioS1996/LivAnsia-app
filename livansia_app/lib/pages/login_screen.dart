import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:livansia_app/pages/user_consent.dart';

import 'authenticate_firebase/sign_in.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const routeName = '/auth';

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
            height: deviceSize.height,
            width: deviceSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  width: 130,
                  image: AssetImage(
                    "assets/6logo.png",
                  ),
                ),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      //sign_in

                      onPressed: () {
                        if (showSignIn) {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) =>
                                  SignIn(toggleView: toggleView),
                            ),
                          );
                        }
                      },

                      child: const Text(
                        'Είσοδος',
                        style: TextStyle(
                          color: Colors.cyan,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      //register
                      child: Text(
                        'Εγγραφή',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) =>
                                Consent(toggleView: toggleView),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
