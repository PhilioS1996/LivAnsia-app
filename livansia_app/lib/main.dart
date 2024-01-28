// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:livansia_app/pages/first_page.dart';
import 'package:livansia_app/pages/wrapper.dart';
import 'package:livansia_app/providers/database_questions_firestore.dart';
import 'package:livansia_app/providers/questions_provider.dart';
import 'package:livansia_app/providers/user_provider.dart';
import 'package:livansia_app/services/authedication_service.dart';

import 'global/loading.dart';
import 'helpers/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Request permission for notifications (only necessary on Android)
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier(),
        ),
        ChangeNotifierProvider<AuthService>(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<DatabaseServiceProvider>(
          create: (context) => DatabaseServiceProvider(),
        ),
        ChangeNotifierProvider<QuestionsProvider>(
          create: (context) => QuestionsProvider(),
        )
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

  Future<String> future() async {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    // final languageNotifier =
    //     Provider.of<LanguageNotifier>(context, listen: false);

    await themeNotifier.setThemeMode();

    //await languageNotifier.getLocale();

    //What is _loading : the start page as we wait for data to set, loader showed.
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _loading = false;
      });
    });
    return 'ok';
  }

  @override
  Widget build(BuildContext context) {
    //set providers
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    //final languageNotifier = Provider.of<LanguageNotifier>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: themeNotifier.themeMode,
      theme: themeNotifier.themeData,
      home:
          //const Wrapper(apoPou: true),
          FutureBuilder(
              future: future(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Wrapper(apoPou: true);
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return const Text("No data");
                }
                return const LoadingSpin();
              }),
    );
  }
}
