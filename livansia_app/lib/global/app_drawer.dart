import 'package:flutter/material.dart';

import '../services/authedication_service.dart';

class AppDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal[100],
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            title: const Text('Σχετικά'),
            trailing: const Icon(Icons.info_outline),
            onTap: () {
              // Navigator.push(context,
              //     new MaterialPageRoute(builder: (context) => About()));
            },
          ),
          Divider(
            color: Colors.indigo[200],
            thickness: 0.75,
          ),
          ListTile(
            title: const Text('Ημερολόγιο'),
            trailing: const Icon(Icons.calendar_today),
            onTap: () {
              // Navigator.push(context,
              //     new MaterialPageRoute(builder: (context) => Calendar()));
            },
          ),
          Divider(
            color: Colors.indigo[200],
            thickness: 0.75,
          ),
          ListTile(
            title: const Text('Quote'),
            trailing: const Icon(Icons.question_answer),
            onTap: () {
              // Navigator.push(context,
              //     new MaterialPageRoute(builder: (context) => Famous()));
            },
          ),
          Divider(
            color: Colors.indigo[200],
            thickness: 0.75,
          ),
          ListTile(
            title: const Text('Οργανισμοί'),
            trailing: const Icon(Icons.contact_phone),
            onTap: () {
              //   Navigator.push(context,
              //       new MaterialPageRoute(builder: (context) => Organizations()));
            },
          ),
          Divider(
            color: Colors.indigo[200],
            thickness: 0.75,
          ),
          ListTile(
            title: const Text('Προφίλ'),
            trailing: const Icon(Icons.account_circle),
            onTap: () {
              // Navigator.push(context,
              //     new MaterialPageRoute(builder: (context) => Profil()));
            },
          ),
          Divider(
            color: Colors.indigo[200],
            thickness: 0.75,
          ),
          ListTile(
            // Log Out.
            title: const Text('Έξοδος'),
            trailing: const Icon(Icons.exit_to_app),
            onTap: () async {
              // await _auth.signOut();
              // Navigator.push(context,
              //     new MaterialPageRoute(builder: (context) => Wrapper(apoPou: true)));
            },
          ),
          Divider(
            color: Colors.indigo[200],
            thickness: 0.75,
          ),
        ],
      ),
    );
  }
}
