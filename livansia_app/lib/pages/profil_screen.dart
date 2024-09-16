import 'package:flutter/material.dart';
import 'package:livansia_app/global/app_drawer.dart';
import 'package:livansia_app/pages/welcome_screens/welcome_screen.dart';
import 'package:livansia_app/providers/database_questions_firestore.dart';
import 'package:livansia_app/services/authedication_service.dart';

import 'package:provider/provider.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final databaseProvider =
        Provider.of<DatabaseServiceProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        backgroundColor: Colors.teal[100],
        //centerTitle: true,
        title: const Text(
          'Προφίλ Χρήστη',
          style: TextStyle(fontSize: 15, color: Colors.black87),
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
      body: Column(
        children: <Widget>[
          const SizedBox(height: 45),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(
                      45, 0, 150, 135), // Defines the color of the border
                  width: 2.0, // Defines the width of the border
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Theme.of(context).cardColor,
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ψευδώνυμο',
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                            fontSizeFactor: 0.8, color: Colors.indigo[300]),
                      ),
                    ),
                    trailing: Text(
                      (authService.userSignIn?.email)!.substring(
                          0, (authService.userSignIn?.email)!.indexOf('@')),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(
                      45, 0, 150, 135), // Defines the color of the border
                  width: 2.0, // Defines the width of the border
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Theme.of(context).cardColor,
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ηλικία',
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                            fontSizeFactor: 0.8, color: Colors.indigo[300]),
                      ),
                    ),
                    trailing: Text(
                      databaseProvider.ageUser,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(
                      45, 0, 150, 135), // Defines the color of the border
                  width: 2.0, // Defines the width of the border
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Theme.of(context).cardColor,
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Φύλο',
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                            fontSizeFactor: 0.8, color: Colors.indigo[300]),
                      ),
                    ),
                    trailing: Text(
                      databaseProvider.genderUser,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(
                      45, 0, 150, 135), // Defines the color of the border
                  width: 2.0, // Defines the width of the border
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Theme.of(context).cardColor,
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ενασχόληση',
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                            fontSizeFactor: 0.8, color: Colors.indigo[300]),
                      ),
                    ),
                    trailing: Text(
                      databaseProvider.jobUser,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
