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

        //centerTitle: true,
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
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Η εφαρμογή LivAnsia έχει αναπτυχθεί στα πλαίσια διπλωματικής εργασίας, του τμήματος Μηχανικών Η/Υ και Πληροφορικής Πατρών από τη Συμεωνίδη Τριανταφυλλιά και ανήκει στην κατηγορία των self-reporting εφαρμογών.\nΗ εφαρμογή απευθύνεται σε φοιτητές και βασική της λειτουργία είναι η μέτρηση των επιπέδων του άγχους που μπορεί να βιώνουν, σε μία συγκεκριμένη χρονική περίοδο, λόγω ακαδημαϊκών τους υποχρεώσεων.\nΗ μέτρηση αυτή, στην εφαρμογή γίνεται απαντώντας σε λίγες και απλές ερωτήσεις, τα αποτελέσματα των οποίων προσμετρώνται ως σκορ (score) και λειτουργεί ως δείκτης στην κλίμακα του άγχους.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Το μόντέλο του ερωτηματολογίου έχει βασιστεί στο State-Trait Anxiety Inventory (STAI) του Spielberger C.D. και στη εφαρμογή χρησιμοποιείται η συμπυκνωμένη έκδοση που αναπτύχθηκε απο τους Marteau TM και Bekker H.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
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
