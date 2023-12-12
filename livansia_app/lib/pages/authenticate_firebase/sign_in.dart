import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:livansia_app/helpers/imports.dart';
import 'package:livansia_app/pages/authenticate_firebase/register.dart';
import 'package:livansia_app/pages/wrapper.dart';
import 'package:livansia_app/providers/user_provider.dart';

import '../../global/loading.dart';
import '../../services/authedication_service.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool showSignIn = false;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  //kanw anafora sto arxeio auth.dart
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool _isButtonDis = false;
  //text field state
  String email = '';
  String password = '';
  String error = '';
  bool eimaiSign = true;
  bool _showPassword = false;

  void _showChangeDialog(String mes) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Aλλαγή Κωδικού'),
        content: Text(mes),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.indigo[200],
              borderRadius: BorderRadius.circular(18.0),
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

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Παρουσιάστηκε Σφάλμα'),
        content: Text(message),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.indigo[200],
              borderRadius: BorderRadius.circular(18.0),
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

  final snackbar = SnackBar(
    content:
        const Text('Πρέπει να εισάγεις πρώτα την διεύθυνση του email σου.'),
    action: SnackBarAction(label: 'Ok', onPressed: () => null),
  );

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return loading
        ? const LoadingSpin()
        : Scaffold(
            body: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 80.0,
              ),
              decoration: const BoxDecoration(color: Colors.white10),
              height: deviceSize.height,
              width: deviceSize.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 100),
                    const Image(
                      width: 87,
                      image: AssetImage("assets/6logo.png"),
                    ),
                    //SizedBox(height: 20.0),

                    Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                          const SizedBox(height: 20.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Nickname',
                            ),
                            keyboardType: TextInputType.text,
                            validator: (val) => val!.isEmpty
                                ? 'Καταχώρησε ένα όνομα για το χρήστη.'
                                : null,
                            onChanged: (val) {
                              setState(() =>
                                  email = '${val.toLowerCase()}@example.com');
                              setState(() {
                                _isButtonDis = !_isButtonDis;
                              });
                            },
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 22,
                                ),
                              ),
                            ),
                            obscureText: !_showPassword,
                            validator: (val) => val!.length < 6
                                ? 'Καταχώρησε κωδικό με 6+ ψηφία.'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.teal[100],
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: ElevatedButton(
                              child: const Text(
                                'Είσοδος',
                                style: TextStyle(color: Colors.black54),
                              ),
                              onPressed: () async {
                                try {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() => loading = true);

                                    await _auth
                                        .signInWithEmailAndPassword(
                                            email, password)
                                        .then((resultUser) {
                                      if (resultUser is! Users) {
                                        if (resultUser
                                            .toString()
                                            .contains('user-not-found')) {
                                          error =
                                              'Δεν βρέθηκε χρήστης με αυτό το email.';
                                          _showErrorDialog(error);
                                        } else if (resultUser
                                            .toString()
                                            .contains('ERROR_WRONG_PASSWORD')) {
                                          error = 'Λάθος Κωδικός Πρόσβασης.';
                                          _showErrorDialog(error);
                                        }
                                        setState(() {
                                          loading = false;
                                        });
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Wrapper(
                                                    apoPou: eimaiSign,
                                                  )),
                                        );
                                      }
                                    });
                                  }
                                } catch (e) {
                                  print('${e.toString()}');
                                }
                              },
                            ),
                          ),
                          ElevatedButton(
                            child: Text(
                              'Εγγραφή',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Register(toggleView: toggleView)),
                              );
                            },
                          ),
                          Builder(
                            builder: (context) => ElevatedButton(
                              onPressed: !_isButtonDis
                                  ? () async {
                                      snackbar;
                                    }
                                  : () async {
                                      _auth.resetPassword(email);
                                      String message =
                                          'Θα σου Aποσταλεί email για Αλλαγή Kωδικού.';
                                      _showChangeDialog(message);
                                    },
                              child: Text(
                                'Ξέχασες τον κωδικό σου;',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            error,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 14.0),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
