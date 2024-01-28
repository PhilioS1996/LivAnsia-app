import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordDialog extends StatefulWidget {
  const ForgotPasswordDialog({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordDialog> createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  TextEditingController emailController = TextEditingController();

  TextEditingController nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text field controllers with saved values if needed
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Επαναφορά Κωδικού'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Column(children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: nicknameController,
            decoration: const InputDecoration(labelText: 'Δηλωμένο Ψευδώνυμο'),
          ),
        ]),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            // Reset password logic
            String email =
                '${nicknameController.text.trim().toLowerCase()}@example.com';
            String actuallEmail = emailController.text.trim();
            if (email.isNotEmpty) {
              try {
                // Check if the email exists in the Firebase database
                await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
                // Email exists, send password reset email
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: actuallEmail);
                // Show a confirmation dialog or handle it as needed
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Το Email Έχει Αποσταλεί'),
                      content: const Text(
                          'Ελέγξτε το email σας για οδηγίες επαναφοράς του κωδικού πρόσβασής σας.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the confirmation dialog
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
                // ignore: unused_catch_clause
              } on FirebaseAuthException catch (e) {
                // Email does not exist in Firebase database
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Το Ψευδώνυμο Δεν Βρέθηκε'),
                      content: const Text(
                          'Το ψευδώνυμο που έχετε δηλώσει δεν υπάρχει στο σύστημα! '),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the error dialog
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            }
          },
          child: const Text('Επαναφορά'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the reset password dialog
          },
          child: const Text('Ακύρωση'),
        ),
      ],
    );
  }
}
