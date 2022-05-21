import 'helpers/imports.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [],
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
      //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
