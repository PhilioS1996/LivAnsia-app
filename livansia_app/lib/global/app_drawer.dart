import '../helpers/imports.dart';
import '../pages/wrapper.dart';
import '../services/authedication_service.dart';

class AppDrawer extends StatelessWidget {
  final AuthService authService = AuthService();
  FirebaseAuth auth = FirebaseAuth.instance;

  AppDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            // decoration: BoxDecoration(
            //   color: Colors.teal[100],
            // ),
            child: Image(
                width: 50,
                image: AssetImage(
                  "assets/6logo.png",
                ),
                fit: BoxFit.contain),
            // const Text(
            //   'Menu',
            //   style: TextStyle(
            //     fontStyle: FontStyle.italic,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //     fontSize: 20,
            //   ),
            // ),
          ),
          Divider(
            color: Colors.indigo[200],
            thickness: 0.75,
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
                await _signOutAndNavigateToWrapper(context);
              }),
          Divider(
            color: Colors.indigo[200],
            thickness: 0.75,
          ),
        ],
      ),
    );
  }

  // Define the function to sign out and navigate to the wrapper
  Future<void> _signOutAndNavigateToWrapper(BuildContext context) async {
    await auth.signOut();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Wrapper(apoPou: false)));
  }
}
