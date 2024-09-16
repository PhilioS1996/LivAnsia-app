import 'package:flutter/foundation.dart';
import 'package:livansia_app/providers/database_questions_firestore.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../helpers/imports.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    with TickerProviderStateMixin {
  late CalendarFormat _calendarFormat;
  DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay;
  List datesHoli = [DateTime(2024, 02, 9)];
  Offset myOffset = Offset(50, 50);

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;

    _selectedDay = DateTime.now();
    initializeDateFormatting('el_GR', null);
  }

  @override
  Widget build(BuildContext context) {
    final databaseProvider =
        Provider.of<DatabaseServiceProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        title: const Text('Ημερολόγιο Καταχωρήσεων',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black87, fontSize: 16)),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TableCalendar(
              locale: 'el_GR',
              firstDay: DateTime.utc(2010, 10, 18),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
                CalendarFormat.twoWeeks: '2 weeks',
                CalendarFormat.week: 'Week',
              },
              onPageChanged: (focusedDay) {
                if (kDebugMode) {
                  print(focusedDay);
                }
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                holidayTextStyle:
                    const TextStyle().copyWith(color: Colors.blue[800]),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle:
                    const TextStyle().copyWith(color: Colors.teal[200]),
              ),
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, _) {
                  final isSelectedDate = databaseProvider.presentationDates.any(
                      (d) =>
                          date.year == d.year &&
                          date.month == d.month &&
                          date.day == d.day);
                  return isSelectedDate
                      ? Stack(
                          children: [
                            Positioned(
                              left: myOffset.dx / 2,
                              bottom: -4,
                              child: Container(
                                width: 18,
                                height: 18,
                                margin: const EdgeInsets.all(6.0),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blueAccent,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        )
                      : null;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.info_outline_rounded),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Με μπλέ κύκλο σημειώνονται οι μέρες που έχει γίνει επιτυχής καταχώρηση.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            )
            // Display additional event details or handle event selection here
          ],
        ),
      ),
    );
  }
}
