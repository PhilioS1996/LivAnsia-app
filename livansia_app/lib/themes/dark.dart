import '../helpers/imports.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  focusColor: Colors.blue[900],
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  dividerColor: Colors.grey[700],
  dividerTheme: DividerThemeData(color: Colors.grey[700]),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.grey[800],
  ),
  cardColor: Colors.grey[900],
  scaffoldBackgroundColor: Colors.black87,
  navigationRailTheme: const NavigationRailThemeData(
    selectedLabelTextStyle: TextStyle(color: Colors.white),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Colors.white38,
    hintStyle: TextStyle(color: Colors.white38),
  ),
  textTheme: TextTheme(
      bodySmall: const TextStyle(fontSize: 14, color: Colors.grey),
      bodyMedium: const TextStyle(
        color: Colors.white70,
        fontSize: 17,
        fontWeight: FontWeight.normal,
      ),
      // subtitle2: TextStyle(fontSize: 30,color: Colors.white),

      subtitle2: const TextStyle(
        fontSize: 14,
      ),
      subtitle1: const TextStyle(fontSize: 16, color: Colors.white),
      headline2: const TextStyle(color: Colors.white, fontSize: 20),
      headline3: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      headline4: const TextStyle(color: Colors.white70, fontSize: 15),
      headline5: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      headline6: const TextStyle(
        color: Color(0Xff646084),
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyText1: const TextStyle(color: Colors.black),
      button: TextStyle(color: Colors.blue[900], fontSize: 16)),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((_) => Colors.blue[800]),
          foregroundColor:
              MaterialStateProperty.resolveWith((_) => Colors.white),
          textStyle: MaterialStateProperty.resolveWith(
              (_) => const TextStyle(color: Colors.white)))),
  toggleButtonsTheme: ToggleButtonsThemeData(
      borderRadius: const BorderRadius.all(Radius.elliptical(32, 32)),
      color: Colors.blue,
      fillColor: Colors.blue[700]),
  iconTheme: const IconThemeData(color: Colors.white),
  primaryIconTheme: const IconThemeData(color: Colors.white, size: 31),
  //accentIconTheme: IconThemeData(color: Colors.grey[400],size: 27),
  tabBarTheme: const TabBarTheme(
    indicator: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white, width: 3))),
  ),
);
