import 'package:flutter/material.dart';
import 'package:livansia_app/global/app_drawer.dart';
import 'package:livansia_app/pages/welcome_screens/welcome_screen.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        backgroundColor: Colors.teal[100],
        title: const Text(
          'Σχετικά με την Εφαρμογή',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.black87,
            ),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()));
            },
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        text: 'Η εφαρμογή ',
                        style: const TextStyle(
                          height: 1.4,
                          fontSize: 20,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'LivAnsia',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.indigo.shade300,
                                fontWeight: FontWeight.w500),
                          ),
                          const TextSpan(
                            text:
                                ' αναπτύχθηκε στα πλαίσια διπλωματικής εργασίας στο Τμήμα Μηχανικών Η/Υ και Πληροφορικής του Πανεπιστημίου Πατρών από την Τριανταφυλλιά Συμεωνίδη. \nΚατατάσσεται στην κατηγορία των εφαρμογών self-reporting και απευθύνεται σε άτομα ηλικίας 15-30 ετών. Κύριος σκοπός της είναι η συλλογή δεδομένων σχετικά με τη χρήση των social media και η ανάλυση των αποτελεσμάτων αυτής της αλληλεπίδρασης.\nΗ συλλογή των δεδομένων γίνεται μέσω ημερήσιας καταχώρησης ερωτηματολογίου, για διάστημα επτά ημερών.',
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 20,
                            ),
                          ),
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
    );
  }
}
