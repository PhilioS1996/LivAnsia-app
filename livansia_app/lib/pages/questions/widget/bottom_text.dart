//the final box in the questionnaire. The text box.
import 'package:flutter/material.dart';
import 'package:livansia_app/providers/questions_provider.dart';
import 'package:provider/provider.dart';

bool loading = false;
String thougths = '';
bool scoreCheck = false;

class BottomThoughtBox extends StatefulWidget {
  final int index;
  const BottomThoughtBox({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomThoughtBox> createState() => _BottomThoughtBoxState();
}

class _BottomThoughtBoxState extends State<BottomThoughtBox> {
  @override
  Widget build(BuildContext context) {
    final questionsProvider =
        Provider.of<QuestionsProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TextFormField(
            focusNode: questionsProvider.focusNodeBox,
            controller: questionsProvider.textBoxController,
            maxLines: 5,
            decoration: InputDecoration(
              label: const Text(
                  'Πές μας δυο λόγια για αυτό: (αν δεν συμμετείχες, ποιος ήταν ο λόγος; σε βοήθησαν τα social media που σε ενημέρωσαν σχετικά;)'),
              labelStyle: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
              hintText:
                  '\t π.χ. έχασα μια συναυλία που πήγαν κάποιοι φίλοι- έμαθα για ένα μαγαζί αλλά είναι ακριβό ',
              hintStyle: const TextStyle(
                fontSize: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(color: Color(0x2C009687), width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: Colors.indigo.shade300, width: 2.0),
              ),
            ),
            keyboardType: TextInputType.multiline,
            onChanged: (val) => {
                  setState(() => thougths = val),
                }),
      ],
    );
  }
}
