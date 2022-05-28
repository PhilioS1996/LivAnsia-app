import '../helpers/imports.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  //primarySwatch: Colors.purple,
  //primaryColor: Colors.deepPurpleAccent[700],
  visualDensity: VisualDensity.adaptivePlatformDensity,
  dividerColor: Colors.grey,
  focusColor: Colors.blue,
  // buttonColor: Colors.white,
  selectedRowColor: Colors.grey[300],
  cardColor: Colors.white,
  dividerTheme: DividerThemeData(color: Colors.grey[100]),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
  ),
  bottomAppBarColor: Colors.blue,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white70,
    hintStyle: TextStyle(
      color: Colors.grey[400],
    ),
  ),
  backgroundColor: Colors.grey[200],
  scaffoldBackgroundColor: Colors.grey[200],
  textTheme: TextTheme(
      //headline1: TextStyle(color: Colors.blue),
      caption: const TextStyle(fontSize: 14, color: Colors.grey),
      subtitle2: const TextStyle(
        fontSize: 14,
      ),
      subtitle1: const TextStyle(
        fontSize: 16,
      ),
      bodyText2: const TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.normal,
      ),
      headline2: const TextStyle(color: Colors.white, fontSize: 20),
      headline3: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      headline4: const TextStyle(color: Colors.black, fontSize: 10),
      headline5: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      headline6: const TextStyle(
        color: Colors.blue,
        fontSize: 17,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(color: Colors.tealAccent[700], fontSize: 16)),
  navigationRailTheme: const NavigationRailThemeData(
    selectedLabelTextStyle: TextStyle(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        primary: Colors.tealAccent[200], onPrimary: Colors.white),
    // ButtonStyle(
    //   backgroundColor:
    //       MaterialStateProperty.resolveWith((_) => Colors.tealAccent[200]),
    //   foregroundColor: MaterialStateProperty.resolveWith((_) => Colors.white),
    //   textStyle: MaterialStateProperty.resolveWith(
    //     (_) => const TextStyle(color: Colors.white),
    //   ),
    // ),
  ),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((_) => Colors.tealAccent[700]),
          foregroundColor:
              MaterialStateProperty.resolveWith((_) => Colors.white),
          textStyle: MaterialStateProperty.resolveWith(
              (_) => const TextStyle(color: Colors.white)))),
  toggleButtonsTheme: ToggleButtonsThemeData(
    borderRadius: BorderRadius.all(Radius.elliptical(32, 32)),
    color: Colors.white,
    fillColor: Colors.blue[700],
  ),
  iconTheme: const IconThemeData(color: Colors.blue),
  primaryIconTheme: const IconThemeData(color: Colors.white, size: 31),
  //accentIconTheme: IconThemeData(color: Colors.black54,size: 27),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
        border:
            Border(top: BorderSide(color: Colors.indigo.shade100, width: 3))),
  ),
  //accentTextTheme: TextTheme(bodyText2: TextStyle(color: Colors.blue),
  // bodyText1: TextStyle(color: Colors.white)
);
