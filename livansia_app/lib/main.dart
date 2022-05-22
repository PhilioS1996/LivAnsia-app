import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:livansia_app/pages/login_screen.dart';
import 'package:livansia_app/pages/wrapper.dart';
import 'package:livansia_app/services/authedication_service.dart';

import 'helpers/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier(),
        ),
        ChangeNotifierProvider<AuthService>(
          create: (context) => AuthService(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _loading = false;

  @override
  void initState() {
    _loading = true;
    future();
    super.initState();
  }

  Future<void> future() async {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    // final languageNotifier =
    //     Provider.of<LanguageNotifier>(context, listen: false);

    await themeNotifier.setThemeMode();

    //await languageNotifier.getLocale();

    //What is _loading : the start page as we wait for data to set, loader showed.
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //set providers
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    //final languageNotifier = Provider.of<LanguageNotifier>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          //const Wrapper(apoPou: true),
          FutureBuilder(
              future: Firebase.initializeApp(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return const Wrapper(apoPou: true);
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return const Text("No data");
                }
                return const CircularProgressIndicator();
              }),
    );
  }
}
