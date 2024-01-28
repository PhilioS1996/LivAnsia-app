import 'package:livansia_app/pages/about_screen.dart';
import 'package:livansia_app/pages/profil_screen.dart';
import 'package:livansia_app/providers/database_questions_firestore.dart';

import '../helpers/imports.dart';
import '../pages/famous_quotes_screen.dart';
import '../pages/organizations_screen.dart';
import '../pages/wrapper.dart';
import '../services/authedication_service.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final AuthService authService = AuthService();

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final databaseProvider =
        Provider.of<DatabaseServiceProvider>(context, listen: false);
    final authService = Provider.of<AuthService>(context, listen: false);
    return Drawer(
      child: ListView(
        //Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            // decoration: BoxDecoration(
            //   color: Colors.teal[100],
            // ),
            child: Container(
              color: Colors.teal[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    iconSize: 30,
                    color: Colors.indigo.shade300,
                    onPressed: _closeDrawer,
                    icon: const Icon(Icons.close_rounded),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Colors.indigo.shade300,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            // Image(
            //     width: 50,
            //     image: AssetImage(
            //       "assets/6logo.png",
            //     ),
            //     fit: BoxFit.contain),
            //     Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Text(
            //       '',
            //       style: TextStyle(
            //         fontStyle: FontStyle.normal,
            //         fontWeight: FontWeight.w500,
            //         color: Colors.indigo.shade300,
            //         fontSize: 30,
            //       ),
            //     ),
            //   ],
            // ),
          ),
          // Divider(
          //   color: Colors.indigo[200],
          //   height: 0,
          // ),
          ListTile(
            title: const Text('Σχετικά'),
            trailing: const Icon(Icons.info_outline),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const About()));
            },
          ),
          Divider(
            color: Colors.indigo[200],
            height: 0,
          ),
          // ListTile(
          //   title: const Text('Ημερολόγιο'),
          //   trailing: const Icon(Icons.calendar_today),
          //   onTap: () {
          //     // Navigator.push(context,
          //     //     new MaterialPageRoute(builder: (context) => Calendar()));
          //   },
          // ),
          // Divider(
          //   color: Colors.indigo[200],
          //   height: 0,
          // ),
          ListTile(
            title: const Text('Quote'),
            trailing: const Icon(Icons.question_answer),
            onTap: () {
              databaseProvider.fetchData();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Famous()));
            },
          ),
          Divider(
            color: Colors.indigo[200],
            height: 0,
          ),
          ListTile(
            title: const Text('Οργανισμοί'),
            trailing: const Icon(Icons.contact_phone),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Organizations()));
            },
          ),
          Divider(
            color: Colors.indigo[200],
            height: 0,
          ),
          ListTile(
            title: const Text('Προφίλ'),
            trailing: const Icon(Icons.account_circle),
            onTap: () async {
              // Check if AuthService instance exists
              final user = authService.userSignIn?.uid;

              await databaseProvider.getUserAge(user);
              await databaseProvider.getUserGender(user);
              await databaseProvider.getUserJob(user);
              // ignore: use_build_context_synchronously
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profil()));
            },
          ),
          Divider(
            color: Colors.indigo[200],
            height: 0,
            // thickness: 0.75,
          ),
          ListTile(
              // Log Out.
              title: const Text('Έξοδος'),
              trailing: const Icon(Icons.exit_to_app),
              onTap: () async {
                await _signOutAndNavigateToWrapper(context);
              }),
          Divider(
            color: Colors.indigo[200],
            height: 0,
          ),
        ],
      ),
    );
  }

  // Define the function to sign out and navigate to the wrapper
  Future<void> _signOutAndNavigateToWrapper(BuildContext context) async {
    await auth.signOut();

    // ignore: use_build_context_synchronously
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Wrapper(apoPou: false)));
  }
}
