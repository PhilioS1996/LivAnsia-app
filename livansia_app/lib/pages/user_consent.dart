import 'package:flutter/material.dart';
import 'package:livansia_app/pages/wrapper.dart';

import 'authenticate_firebase/register.dart';

class Consent extends StatelessWidget {
  final Function toggleView;
  const Consent({Key? key, required this.toggleView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            // vertical: ,
          ),
          decoration: const BoxDecoration(color: Colors.white),
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: const TextSpan(
                    text: 'Πολιτική Απορρήτου\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '\nΗ εφαρμογή αποθηκεύει, τα προσωπικά δεδομένα που καταχωρούνται κατά την εγγραφή του χρήστη (διεύθυνση email, ημερομηνία γέννησης και φύλο) καθώς και τις απαντήσεις στις καταχωρίσεις που θα πραγματοποιηθούν. Τα στοιχεία αυτά θα διατηρηθούν για διάστημα ενός μηνός μετά το τέλος του πειράματος. Στη συνέχεια θα γίνει ανωνυμοποίηση των στοιχείων και θα χρησιμοποιηθούν για ερευνητικούς σκοπούς.\n',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Έχω διαβάσει, κατανοώ την πολιτική απορρήτου και συμφωνώ να συμμετάσχω, μέσω αυτής της εφαρμογής, στην έρευνα που διεξάγεται στα πλαίσια διπλωματικής εργασίας του Τμήματος Η/Υ και Πληροφορικής του Πανεπιστημίου Πατρών.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ]),
              ),
              const SizedBox(
                height: 80,
              ),
              BottomAppBar(
                elevation: 0,

                //alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        backgroundColor: Colors.teal[100],
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Wrapper(apoPou: false)),
                        );
                      },
                      child: Container(
                        // width: 310,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: const Text(
                          'Διαφωνώ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        backgroundColor: Colors.teal[100],
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Register(toggleView: toggleView)),
                        );
                      },
                      child: Container(
                        // width: 310,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: const Text(
                          'Συμφωνώ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
