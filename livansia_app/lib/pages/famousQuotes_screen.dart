import 'package:flutter/material.dart';
import 'package:livansia_app/global/app_drawer.dart';

import 'package:provider/provider.dart';

import '../global/functions/database_questions_firestore.dart';
import 'questions/widget/quotes_tile.dart';
import 'welcome_screens/welcome_screen.dart';

class Famous extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final databaseProvider =
        Provider.of<DatabaseServiceProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        backgroundColor: Colors.teal[100],
        title: const Text(
          'Λόγια για Έμπνευση και Εμψύχωση',
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
      drawer: AppDrawer(),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: databaseProvider.listQuotes!.length,
              itemBuilder: (BuildContext context, int index) {
                return QuotesTile(
                  quo: databaseProvider.listQuotes![index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
