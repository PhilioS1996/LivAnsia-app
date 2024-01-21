// import 'package:flutter/material.dart';

// import 'package:intl/intl.dart';
// import 'package:livansia_app/models/get_event_date.dart';
// import 'package:livansia_app/models/users.dart';

// import 'package:provider/provider.dart';
// import 'package:table_calendar/table_calendar.dart';

// // Example holidays
// // final Map<DateTime, List> _holidays = {
// //   DateTime(2019, 1, 1): ['New Year\'s Day'],
// //   DateTime(2019, 1, 6): ['Epiphany'],
// //   DateTime(2019, 2, 14): ['Valentine\'s Day'],
// //   DateTime(2019, 4, 21): ['Easter Sunday'],
// //   DateTime(2019, 4, 22): ['Easter Monday'],
// // };

// Map<DateTime, List> _holidays = {};
// UserData userData;

// class MakeCal extends StatefulWidget {
//   final EventDate evdate;

//   MakeCal({this.evdate});
//   @override
//   _MakeCalState createState() => _MakeCalState(evdate: evdate);
// }

// class _MakeCalState extends State<MakeCal> with TickerProviderStateMixin {
//   final EventDate evdate;
//   _MakeCalState({this.evdate});

//   Map<DateTime, List> _events;
//   List _selectedEvents = [];
//   AnimationController _animationController;
//   CalendarController _calendarController;
//   List inputDays = [];
//   var date = new DateTime.now();
//   int counter = 0;
//   //final databaseReference = Firestore.instance;

//   void initState() {
//     super.initState();

//     final _selectedDay = DateTime.now();

//     //lista poy krata tis hmeromhnies
//     //inputDays.add(_selectedDay);

//     // int megethos = (inputDays.length);

//     _events = {
//       _selectedDay.add(Duration(days: 0)): [
//         'Event A14',
//         'Event B14',
//         'Event C14'
//       ],
//     };

//     //_selectedEvents = _events[_selectedDay] ?? [];
//     _calendarController = CalendarController();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 400),
//     );

//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     _calendarController.dispose();
//     super.dispose();
//   }

//   void _onDaySelected(DateTime day, List _holidays) {
//     print('hrtha $_holidays');

//     print('CALLBACK: _onDaySelected');

//     setState(() {
//       _selectedEvents = _holidays;
//     });
//   }

//   // void _onVisibleDaysChanged(
//   //     DateTime first, DateTime last, CalendarFormat format) {
//   //   print('CALLBACK: _onVisibleDaysChanged');
//   // }

//   void _onCalendarCreated(
//       DateTime first, DateTime last, CalendarFormat format) {
//     print('CALLBACK: _onCalendarCreated');
//   }

//   setHolidays() {
//     List atten;
//     //List secondA = [];
//     // var met = atten[0];
//     if (userData.parousies != null) {
//       if (counter == 0) atten = userData.parousies;
//     }
//     int len = atten.length;

//     print(len);
//     if (len == 0) {
//       _holidays = {};
//     }
//     List<DateTime> todayDate = [];
//     for (int i = 0; i < len; i++) {
//       print('to i eia $i');
//       // met = atten2[i];
//       todayDate.add(DateTime.parse(atten[i]));
//       print(todayDate[i]);
//     }

//     for (int i = 0; i < todayDate.length; i++) {
//       _holidays = {
//         todayDate[i]: ['${DateFormat.jm().format(todayDate[i])}'],
//         DateTime(2020, 1, 1): ['New Year\'s Day'],
//       };

//       _selectedEvents.add(_holidays[todayDate[i]]);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<User>(context);

//     return StreamBuilder<UserData>(
//         stream: user.uid != null
//             ? DatabaseService(uid: user.uid).userData
//             : AuthScreen(),
//         builder: (context, snapshot) {
//           try {
//             if (snapshot.hasData) {
//               userData = snapshot.data;
//               //var attendance = ;
//               //String imeromhnies = userData.parousies.last;

//               // if (userData.parousies != null && counter == 0) {
//               //   setHolidays();
//               // }
//               if (userData.parousies != null) {
//                 if (counter == 0) setHolidays();
//               }

//               //for (int i = 0; i <= len; i++) print('${attendance[i]}');
//               //imeromhnies.forEach((i) => print(i));
//               return MaterialApp(
//                 localizationsDelegates: [
//                   GlobalMaterialLocalizations.delegate,
//                   GlobalWidgetsLocalizations.delegate,
//                 ],
//                 // supportedLocales: [
//                 //   new Locale('el'),
//                 // ],
//                 home: Scaffold(
//                   body: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: <Widget>[
//                       // Switch out 2 lines below to play with TableCalendar's settings
//                       //-----------------------
//                       //DatesList(),

//                       _buildTableCalendarWithBuilders(),

//                       //_buildTableCalendar(),
//                       // _buildTableCalendarWithBuilders(),
//                       // Text(snapshot.data.documents['date']),
//                       const SizedBox(height: 25),
//                       _buildButtons(),
//                       const SizedBox(height: 8.0),
//                       // Expanded(
//                       //   child: _buildEventList(),
//                       // ),
//                     ],
//                   ),
//                 ),
//               );
//             } else {
//               return Loading();
//             }
//           } catch (e) {
//             print('gffdf  ${e.toString()}');
//             return Container(
//               height: 0,
//             );
//           }
//         });
//   }

//   // More advanced TableCalendar configuration (using Builders & Styles)
//   Widget _buildTableCalendarWithBuilders() {
//     print('buildTableCalendar');
//     return TableCalendar(
//       locale: 'el',
//       calendarController: _calendarController,
//       //events: _events,
//       holidays: _holidays,
//       initialCalendarFormat: CalendarFormat.month,
//       formatAnimation: FormatAnimation.slide,
//       startingDayOfWeek: StartingDayOfWeek.monday,
//       availableGestures: AvailableGestures.all,
//       availableCalendarFormats: const {
//         CalendarFormat.month: '',
//         CalendarFormat.week: '',
//       },
//       calendarStyle: CalendarStyle(
//         outsideDaysVisible: false,
//         weekendStyle: TextStyle().copyWith(color: Colors.teal[200]),
//         holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
//       ),
//       daysOfWeekStyle: DaysOfWeekStyle(
//         weekendStyle: TextStyle().copyWith(color: Colors.teal[200]),
//       ),
//       headerStyle: HeaderStyle(
//         centerHeaderTitle: true,
//         formatButtonVisible: false,
//       ),
//       builders: CalendarBuilders(
//         selectedDayBuilder: (context, date, _) {
//           return FadeTransition(
//             opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
//             child: Container(
//               margin: const EdgeInsets.all(4.0),
//               padding: const EdgeInsets.only(top: 5.0, left: 6.0),
//               color: Colors.grey[300],
//               width: 100,
//               height: 100,
//               child: Text(
//                 '${date.day}',
//                 style: TextStyle().copyWith(fontSize: 16.0),
//               ),
//             ),
//           );
//         },
//         todayDayBuilder: (context, date, _) {
//           return Container(
//             margin: const EdgeInsets.all(4.0),
//             padding: const EdgeInsets.only(top: 5.0, left: 6.0),
//             color: Colors.blue[100],
//             width: 100,
//             height: 100,
//             child: Text(
//               '${date.day}',
//               style: TextStyle().copyWith(fontSize: 16.0),
//             ),
//           );
//         },
//         markersBuilder: (context, date, events, holidays) {
//           final children = <Widget>[];

//           if (holidays.isNotEmpty) {
//             children.add(
//               Positioned(
//                 right: -2,
//                 bottom: -2,
//                 child: _buildHolidaysMarker(),
//               ),
//             );
//           }

//           return children;
//         },
//       ),
//       onDaySelected: (date, _holidays) {
//         print('edw hrua telikaaaaaaaaaaa');
//         //print('ta keys ${_holidays.containsKey(date)}');

//         // if (userData.parousies != null && counter == 0) {
//         //   setHolidays();
//         //   _onDaySelected(date, _holidays);
//         // }
//         _animationController.forward(from: 0.0);
//         // if (userData.parousies != null) {
//         //   setHolidays(userData.parousies);
//         //   _onDaySelected(date, _holidays);
//         //   _animationController.forward(from: 0.0);
//         // }
//       },
//       //onVisibleDaysChanged: _onVisibleDaysChanged,
//       onCalendarCreated: _onCalendarCreated,
//     );
//   }

//   Widget _buildEventsMarker(DateTime date, List events) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         color: _calendarController.isSelected(date)
//             ? Colors.brown[500]
//             : _calendarController.isToday(date)
//                 ? Colors.brown[300]
//                 : Colors.blue[400],
//       ),
//       width: 16.0,
//       height: 16.0,
//       child: Center(
//         child: Text(
//           '${events.length}',
//           style: TextStyle().copyWith(
//             color: Colors.white,
//             fontSize: 12.0,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHolidaysMarker() {
//     return Icon(
//       Icons.check_circle,
//       size: 20.0,
//       color: Colors.indigo[200],
//     );
//   }

//   Widget _buildButtons() {
//     final dateTime = DateTime.now();

//     print('to counter einai $counter');
//     return Column(
//       children: <Widget>[
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             RaisedButton(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(18.0),
//               ),
//               child: Text('Month'),
//               onPressed: () {
//                 setState(() {
//                   _calendarController.setCalendarFormat(CalendarFormat.month);
//                 });
//                 setState(() {
//                   counter = 0;
//                 });
//               },
//             ),
//             RaisedButton(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(18.0),
//               ),
//               child: Text('2 weeks'),
//               onPressed: () {
//                 setState(() {
//                   _calendarController
//                       .setCalendarFormat(CalendarFormat.twoWeeks);
//                 });
//                 setState(() {
//                   counter++;
//                 });
//               },
//             ),
//             RaisedButton(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(18.0),
//               ),
//               child: Text('Week'),
//               onPressed: () {
//                 setState(() {
//                   _calendarController.setCalendarFormat(CalendarFormat.week);
//                 });
//                 setState(() {
//                   counter++;
//                 });
//               },
//             ),
//           ],
//         ),
//         SizedBox(height: 8.0),
//         // RaisedButton(
//         //   shape: RoundedRectangleBorder(
//         //     borderRadius: BorderRadius.circular(18.0),
//         //   ),
//         //   child: Text(
//         //       'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
//         //   onPressed: () {
//         //     _calendarController.setSelectedDay(
//         //       dateTime,
//         //       runCallback: true,
//         //     );
//         //   },
//         // ),
//       ],
//     );
//   }

//   Widget _buildEventList() {
//     //var numer = _holidays.whereType<DateTime>();
//     print('23233 ${_holidays.keys}');
//     print('obgect $_selectedEvents');
//     return ListView(
//       children: _selectedEvents
//           .map((_holiday) => Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 0.8),
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
//                 child: ListTile(
//                   title: Text('Ώρα Καταχώρησης  ${_holiday.toString()}'),
//                   onTap: () => print(' tapped!'),
//                 ),
//               ))
//           .toList(),
//     );
//   }
// }
