import '../helpers/imports.dart';

ThemeData lightThemeMobile = ThemeData(
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
  floatingActionButtonTheme: FloatingActionButtonThemeData(
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
      caption: TextStyle(fontSize: 14, color: Colors.grey),
      subtitle2: TextStyle(
        fontSize: 14,
      ),
      subtitle1: TextStyle(
        fontSize: 17,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.normal,
      ),
      headline2: TextStyle(color: Colors.white, fontSize: 20),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      headline4: TextStyle(color: Colors.black, fontSize: 10),
      headline5: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      headline6: TextStyle(
        color: Colors.blue,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(color: Colors.tealAccent[700], fontSize: 16)),
  navigationRailTheme: NavigationRailThemeData(
    selectedLabelTextStyle: TextStyle(color: Colors.white),
  ),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((_) => Colors.tealAccent[700]),
          foregroundColor: MaterialStateProperty.resolveWith((_) => Colors.white),
          textStyle: MaterialStateProperty.resolveWith((_) => TextStyle(color: Colors.white)))),
  toggleButtonsTheme: ToggleButtonsThemeData(
    borderRadius: BorderRadius.all(Radius.elliptical(32, 32)),
    borderWidth: Utilities.toggleBorder,
    color: Colors.white,
    fillColor: Colors.blue[700],
  ),
  iconTheme: IconThemeData(color: Colors.blue),
  primaryIconTheme: IconThemeData(color: Colors.white, size: 31),
  //accentIconTheme: IconThemeData(color: Colors.black54,size: 27),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(border: Border(top: BorderSide(color: Colors.indigo[50], width: 3))),
  ),
  //accentTextTheme: TextTheme(bodyText2: TextStyle(color: Colors.blue),
  // bodyText1: TextStyle(color: Colors.white)
)..addOwn(
    OwnThemeFields(
      routeExecutionsPageColor: Colors.blue,
      middleButton: Colors.tealAccent[700],
      onlineRouteIcon: Colors.white,
      textFieldFillColor: Colors.white,
      tabBarWidgetsColor: Colors.blue,
      popUpTextColor: Colors.black,
      subCardColor: Colors.white,
      backgroundCardPop: Colors.grey[200],
      availableBusColor: Colors.blue,
      paidBusColor: Colors.pink[200],
      reservedBusColor: Colors.grey[600],
      selectedBusColor: Colors.teal[600],
    ),
  );

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
  floatingActionButtonTheme: FloatingActionButtonThemeData(
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
      caption: TextStyle(fontSize: 14, color: Colors.grey),
      subtitle2: TextStyle(
        fontSize: 16,
      ),
      subtitle1: TextStyle(
        fontSize: 20,
        // fontSize: GlobalVariables.isBusDriver() ? 20 : 16,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.normal,
      ),
      headline2: TextStyle(color: Colors.white, fontSize: 24),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 26,
      ),
      headline4: TextStyle(color: Colors.black, fontSize: 12),
      headline5: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      headline6: TextStyle(
        color: Colors.blue,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(color: Colors.tealAccent[700], fontSize: 16)),
  navigationRailTheme: NavigationRailThemeData(
    selectedLabelTextStyle: TextStyle(color: Colors.white),
  ),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((_) => Colors.tealAccent[700]),
          foregroundColor: MaterialStateProperty.resolveWith((_) => Colors.white),
          textStyle: MaterialStateProperty.resolveWith((_) => TextStyle(color: Colors.white)))),
  toggleButtonsTheme: ToggleButtonsThemeData(
    borderRadius: BorderRadius.all(Radius.elliptical(32, 32)),
    borderWidth: Utilities.toggleBorder,
    color: Colors.white,
    fillColor: Colors.blue[700],
  ),
  iconTheme: IconThemeData(color: Colors.blue),
  primaryIconTheme: IconThemeData(color: Colors.white, size: 31),
  //accentIconTheme: IconThemeData(color: Colors.black54,size: 27),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(border: Border(top: BorderSide(color: Colors.indigo[50], width: 3))),
  ),
  //accentTextTheme: TextTheme(bodyText2: TextStyle(color: Colors.blue),
  // bodyText1: TextStyle(color: Colors.white)
  //)
)..addOwn(
    OwnThemeFields(
      routeExecutionsPageColor: Colors.blue,
      middleButton: Colors.tealAccent[700],
      tabBarWidgetsColor: Colors.blue,
      onlineRouteIcon: Colors.white,
      subCardColor: Colors.white,
      popUpTextColor: Colors.black,
      textFieldFillColor: Colors.white,
      backgroundCardPop: Colors.grey[200],
      availableBusColor: Colors.blue,
      paidBusColor: Colors.pink[200],
      reservedBusColor: Colors.grey[600],
      selectedBusColor: Colors.teal[500],
    ),
  );
