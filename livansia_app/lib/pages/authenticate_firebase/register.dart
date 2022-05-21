import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:livansia_app/global/loading.dart';
import 'package:livansia_app/pages/authenticate_firebase/sign_in.dart';
import 'package:livansia_app/pages/wrapper.dart';

import '../../helpers/imports.dart';
import '../../services/authedication_service.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading = false;
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  String email = '';
  String password = '';
  String error = '';
  bool eimaiRegister = false;

  bool _showPassword = false;
  bool _showPassword2 = false;

  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Παρουσιάστηκε Σφάλμα'),
        content: Text(message),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo[200],
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: ElevatedButton(
              //elevation: 1.2,

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
    final deviceSize = MediaQuery.of(context).size;

    return loading
        ? LoagingSpin()
        : Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 80.0,
                  horizontal: 80.0,
                ),
                decoration: const BoxDecoration(color: Colors.white10),
                height: deviceSize.height,
                width: deviceSize.width,
                //child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Image(
                        width: 87,
                        image: AssetImage("assets/6logo.png"),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                helperText: '(διεύθυνση ceid webmail)',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) => val!.isEmpty
                                  ? 'Καταχώρησε την ηλεκτρονική σου διεύθυνση'
                                  : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              obscureText: !_showPassword,
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
                              controller: _passwordController,
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
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showPassword2 = !_showPassword2;
                                    });
                                  },
                                  child: Icon(
                                    _showPassword2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 22,
                                  ),
                                ),
                              ),
                              obscureText: !_showPassword2,
                              validator: (val) =>
                                  val != _passwordController.text
                                      ? 'Οι κωδικοί δεν είναι ίδιοι!'
                                      : null,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.teal[100],
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: ElevatedButton(
                                child: const Text(
                                  'Εγγραφή',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() => loading = true);
                                    dynamic result = await _auth
                                        .registerWithEmailAndPassword(
                                            email, password);
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Wrapper(
                                                apoPou: eimaiRegister,
                                              )
                                          //WelcomeScreen(),
                                          ),
                                    );
                                    if (!result is Users) {
                                      if (kDebugMode) {
                                        print('$result');
                                      }
                                      if (result
                                          .toString()
                                          .contains('ERROR_INVALID_EMAIL')) {
                                        error = 'Λανθασμένη σύνταξη του email.';
                                        _showErrorDialog(error);
                                      } else if (result.toString().contains(
                                          'ERROR_EMAIL_ALREADY_IN_USE')) {
                                        error =
                                            'Υπάρχει ήδη χρήστης με αυτό το email.';
                                        _showErrorDialog(error);
                                      }
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                  }
                                },
                              ),
                            ),
                            ElevatedButton(
                              child: Text(
                                'Είσοδος',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          SignIn(toggleView: toggleView)),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              error,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    ]),
                //),
              ),
            ),
          );
  }
}
