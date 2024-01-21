import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../helpers/imports.dart';
import '../../../providers/questions_provider.dart';

class TwoTextBoxWidget extends StatefulWidget {
  final int index;
  const TwoTextBoxWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<TwoTextBoxWidget> createState() => _TwoTextBoxWidgetState();
}

class _TwoTextBoxWidgetState extends State<TwoTextBoxWidget> {
  int selectButton = -1;
  // TextEditingController screenTimeController = TextEditingController();
  // TextEditingController appUsedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final questionsProvider =
        Provider.of<QuestionsProvider>(context, listen: true);
    return Card(
      key: questionsProvider.key1,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: questionsProvider.doubleTextContainerColor,
          //Color(0x2C009687), // Defines the color of the border
          width: 2.0, // Defines the width of the border
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Theme.of(context).cardColor,
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.only(top: 0, left: 18, right: 18, bottom: 30),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Text(
                  'Συνολικό Screen Time:',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.indigo.shade100,
                        width: 2,
                      ),
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: questionsProvider.screenTimeContr,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Text(
                  'Εφαρμογή:',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.indigo.shade100,
                        width: 2,
                      ),
                    ),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: questionsProvider.appUseContr,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
