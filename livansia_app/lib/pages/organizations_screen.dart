import 'package:android_intent/android_intent.dart';
import 'package:livansia_app/global/app_drawer.dart';
import 'package:flutter/material.dart';
import 'welcome_screens/welcome_screen.dart';

Future<void> openUrl(String url, BuildContext context) async {
  if (Theme.of(context).platform == TargetPlatform.android) {
    final AndroidIntent intent = AndroidIntent(
      action: 'action_view',
      data: Uri.encodeFull(url),
      package:
          'com.android.chrome', // Specify the package name of a browser (e.g., Chrome)
    );
    await intent.launch();
  }
}

class Organizations extends StatelessWidget {
  const Organizations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text(
          'Οργανισμοί Ψυχολογικής Υποστήριξης',
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
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 45),
            ListTile(
              leading: Icon(
                Icons.radio_button_checked,
                color: Colors.indigo[300],
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Γραφείο Ψυχολογικής Στήριξης Φοιτητών Πανεπιστημίου Πατρών',
                    style: Theme.of(context).textTheme.titleLarge!.apply(
                          fontSizeFactor: 0.9,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: const Text(
                      'Ιστοσελίδα: http://www.upatras.gr/el/node/4112',
                      style: TextStyle(fontSize: 13),
                    ),
                    onTap: () =>
                        openUrl('http://www.upatras.gr/el/node/4112', context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(
                Icons.radio_button_checked,
                color: Colors.indigo[300],
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Κοινωνικός Οργανισμός Δήμου Πατρέων(Κ.Ο.ΔΗ.Π.)',
                    style: Theme.of(context).textTheme.titleLarge?.apply(
                          fontSizeFactor: 0.9,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: const Text(
                      'Ιστοσελίδα: http://www.kodip.gr/index.php/men-koinoniki-yposthriksh',
                      style: TextStyle(fontSize: 13),
                    ),
                    onTap: () => openUrl(
                        'http://www.kodip.gr/index.php/men-koinoniki-yposthriksh',
                        context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(
                Icons.radio_button_checked,
                color: Colors.indigo[300],
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Σύλλογος για Ψυχική Υγεία - ΣΟΨΥ Πάτρας',
                    style: Theme.of(context).textTheme.titleLarge?.apply(
                          fontSizeFactor: 0.9,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: const Text(
                      'Ιστοσελίδα: http://sopsipatron.gr/ypiresies/',
                      style: TextStyle(fontSize: 13),
                    ),
                    onTap: () =>
                        openUrl('http://sopsipatron.gr/ypiresies/', context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(
                Icons.radio_button_checked,
                color: Colors.indigo[300],
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Γραφείο Διασύνδεσης Πανεπιστημίου Πατρών',
                    style: Theme.of(context).textTheme.titleLarge?.apply(
                          fontSizeFactor: 0.9,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: const Text(
                      'Ιστοσελίδα: https://www.cais.upatras.gr/',
                      style: TextStyle(fontSize: 13),
                    ),
                    onTap: () =>
                        openUrl('https://www.cais.upatras.gr/', context),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
