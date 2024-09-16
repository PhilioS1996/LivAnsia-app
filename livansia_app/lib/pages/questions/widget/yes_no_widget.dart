import '../../../helpers/imports.dart';
import '../../../providers/questions_provider.dart';

class YesNoWidget extends StatefulWidget {
  final int index;
  const YesNoWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<YesNoWidget> createState() => _YesNoWidgetState();
}

class _YesNoWidgetState extends State<YesNoWidget> {
  int yesNoRadio = -1;
  int yesNoRadioExtra = -1;
  int firstQuestion =
      -1; // the answer for the first part of the complex question

  bool extraQuestion = false;
  @override
  Widget build(BuildContext context) {
    final questionsProvider =
        Provider.of<QuestionsProvider>(context, listen: true);
    return Column(
      children: [
        Card(
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
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    textColor:
                        yesNoRadio == 1 ? Colors.indigo.shade300 : Colors.black,
                    title: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Radio<int>(
                            value: 1,
                            groupValue: yesNoRadio,
                            activeColor: Colors.indigo.shade400,
                            onChanged: (value) {
                              setState(() {
                                yesNoRadio = value!;
                                if (widget.index == 4) {
                                  firstQuestion = yesNoRadio;
                                  extraQuestion = false;
                                  yesNoRadioExtra = -1;
                                }
                              });
                              questionsProvider.setValuePickedSlider(
                                  value!, widget.index, '');
                            },
                          ),
                          const Text('Ναι'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                      textColor: yesNoRadio == 2
                          ? Colors.indigo.shade300
                          : Colors.black,
                      title: Row(
                        children: [
                          Radio<int>(
                            value: 2,
                            groupValue: yesNoRadio,
                            activeColor: Colors.indigo.shade300,
                            onChanged: (value) {
                              setState(() {
                                yesNoRadio = value!;
                                if (widget.index == 4) {
                                  firstQuestion = yesNoRadio;
                                  extraQuestion = true;
                                }
                              });
                              questionsProvider.setValuePickedSlider(
                                  value!, widget.index, '');
                            },
                          ),
                          const Text('Όχι'),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          maintainAnimation: true,
          maintainState: true,
          visible: extraQuestion,
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
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const ListTile(
                    contentPadding: EdgeInsets.only(
                      left: 15,
                    ),
                    title: Text(
                      'Θα ήθελες να είσαι περισσότερο ενημερωμένος?',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          textColor: yesNoRadioExtra == 1
                              ? Colors.indigo.shade300
                              : Colors.black,
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Radio<int>(
                                  value: 1,
                                  groupValue: yesNoRadioExtra,
                                  activeColor: Colors.indigo.shade400,
                                  onChanged: (value) {
                                    setState(() {
                                      yesNoRadioExtra = value!;
                                    });
                                    questionsProvider.setValuePickedSlider(
                                        firstQuestion,
                                        widget.index,
                                        'Extra Question: ${value!}');
                                  },
                                ),
                                const Text('Ναι'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                            textColor: yesNoRadioExtra == 2
                                ? Colors.indigo.shade300
                                : Colors.black,
                            title: Row(
                              children: [
                                Radio<int>(
                                  value: 2,
                                  groupValue: yesNoRadioExtra,
                                  activeColor: Colors.indigo.shade300,
                                  onChanged: (value) {
                                    setState(() {
                                      yesNoRadioExtra = value!;
                                    });
                                    questionsProvider.setValuePickedSlider(
                                        firstQuestion,
                                        widget.index,
                                        'Extra Question: ${value!}');
                                  },
                                ),
                                const Text('Όχι'),
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
