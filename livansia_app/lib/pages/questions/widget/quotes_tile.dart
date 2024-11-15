// the tile design for the quotes display
import 'package:flutter/material.dart';

class QuotesTile extends StatelessWidget {
  final String quo;

  const QuotesTile({Key? key, required this.quo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color.fromARGB(
                    45, 0, 150, 135), // Defines the color of the border
                width: 2.0, // Defines the width of the border
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Theme.of(context).cardColor,
            elevation: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      quo,
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
