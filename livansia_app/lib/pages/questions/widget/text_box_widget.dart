import 'package:livansia_app/pages/questions/widget/bottom_text.dart';
import '../../../helpers/imports.dart';
import '../../../providers/questions_provider.dart';

class TextBoxWidget extends StatefulWidget {
  final int index;
  const TextBoxWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  int multiRadio = -1;

  @override
  Widget build(BuildContext context) {
    final questionsProvider =
        Provider.of<QuestionsProvider>(context, listen: true);
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0x2C009687), // Defines the color of the border
              width: 2.0, // Defines the width of the border
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Theme.of(context).cardColor,
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ListTile(
                  textColor:
                      multiRadio == 1 ? Colors.indigo.shade300 : Colors.black,
                  title: Row(
                    children: [
                      Radio<int>(
                        value: 1,
                        groupValue: multiRadio,
                        activeColor: Colors.indigo.shade400,
                        onChanged: (value) {
                          setState(() {
                            multiRadio = value!;
                          });
                          questionsProvider.setValuePickedSlider(
                              value!, widget.index, '');
                          questionsProvider.setRadioValLastComplex(value);
                        },
                      ),
                      const Text('Όχι, δεν έμαθα.'),
                    ],
                  ),
                ),
                ListTile(
                  textColor:
                      multiRadio == 2 ? Colors.indigo.shade300 : Colors.black,
                  title: Row(
                    children: [
                      Radio<int>(
                        value: 2,
                        groupValue: multiRadio,
                        activeColor: Colors.indigo.shade300,
                        onChanged: (value) {
                          setState(() {
                            multiRadio = value!;
                          });
                          questionsProvider.setValuePickedSlider(
                              value!, widget.index, '');
                          questionsProvider.setRadioValLastComplex(value);
                        },
                      ),
                      const Text('Έμαθα και θα πάω/κάνω.'),
                    ],
                  ),
                ),
                ListTile(
                  textColor:
                      multiRadio == 3 ? Colors.indigo.shade300 : Colors.black,
                  title: Row(
                    children: [
                      Radio<int>(
                        value: 3,
                        groupValue: multiRadio,
                        activeColor: Colors.indigo.shade400,
                        onChanged: (value) {
                          setState(() {
                            multiRadio = value!;
                          });
                          questionsProvider.setValuePickedSlider(
                              value!, widget.index, '');
                          questionsProvider.setRadioValLastComplex(value);
                        },
                      ),
                      const Text('Έμαθα και δεν θα πάω/κάνω.'),
                    ],
                  ),
                ),
                ListTile(
                  textColor:
                      multiRadio == 4 ? Colors.indigo.shade300 : Colors.black,
                  title: Row(
                    children: [
                      Radio<int>(
                        value: 4,
                        groupValue: multiRadio,
                        activeColor: Colors.indigo.shade400,
                        onChanged: (value) {
                          setState(() {
                            multiRadio = value!;
                          });
                          questionsProvider.setValuePickedSlider(
                              value!, widget.index, '');
                          questionsProvider.setRadioValLastComplex(value);
                        },
                      ),
                      const Text('Έμαθα και δεν ξέρω αν θα πάω/κάνω.'),
                    ],
                  ),
                ),
                ListTile(
                  textColor:
                      multiRadio == 5 ? Colors.indigo.shade300 : Colors.black,
                  title: Row(
                    children: [
                      Radio<int>(
                        value: 5,
                        groupValue: multiRadio,
                        activeColor: Colors.indigo.shade400,
                        onChanged: (value) {
                          setState(() {
                            multiRadio = value!;
                          });
                          questionsProvider.setValuePickedSlider(
                              value!, widget.index, '');
                          questionsProvider.setRadioValLastComplex(value);
                        },
                      ),
                      const Text('Θα πήγαινα/έκανα αλλά έγινε ήδη.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Theme.of(context).cardColor,
            elevation: 2,
            child: SizedBox(
              // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              width: MediaQuery.of(context).size.width,
              child: BottomThoughtBox(
                index: widget.index,
              ),
            ),
          ),
        )
      ],
    );
  }
}
