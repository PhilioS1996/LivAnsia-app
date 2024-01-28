import '../../../helpers/imports.dart';
import '../../../providers/questions_provider.dart';

class IconButtonWidget extends StatefulWidget {
  final int index;
  const IconButtonWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  int selectButton = -1;

  @override
  Widget build(BuildContext context) {
    final questionsProvider =
        Provider.of<QuestionsProvider>(context, listen: true);
    return Card(
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              iconSize: 26,
              color: selectButton == 0 ? Colors.indigo.shade300 : Colors.black,
              onPressed: () {
                setState(() {
                  selectButton = 0;
                });
                questionsProvider.setValuePickedSlider(0, widget.index, '');
              },
              icon: const Icon(Icons.sentiment_dissatisfied_outlined),
            ),
            widget.index != 5
                ? IconButton(
                    iconSize: 26,
                    color: selectButton == 1
                        ? Colors.indigo.shade300
                        : Colors.black,
                    onPressed: () {
                      setState(() {
                        selectButton = 1;
                      });
                      questionsProvider.setValuePickedSlider(
                          1, widget.index, '');
                    },
                    icon: const Icon(Icons.sentiment_dissatisfied),
                  )
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
            IconButton(
              iconSize: 26,
              color: selectButton == 2 ? Colors.indigo.shade300 : Colors.black,
              onPressed: () {
                setState(() {
                  selectButton = 2;
                });
                questionsProvider.setValuePickedSlider(2, widget.index, '');
              },
              icon: const Icon(Icons.sentiment_neutral_outlined),
            ),
            widget.index != 5
                ? IconButton(
                    iconSize: 26,
                    color: selectButton == 3
                        ? Colors.indigo.shade300
                        : Colors.black,
                    onPressed: () {
                      setState(() {
                        selectButton = 3;
                      });
                      questionsProvider.setValuePickedSlider(
                          3, widget.index, '');
                    },
                    icon: const Icon(Icons.sentiment_satisfied_outlined),
                  )
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
            IconButton(
              iconSize: 26,
              color: selectButton == 4 ? Colors.indigo.shade300 : Colors.black,
              onPressed: () {
                setState(() {
                  selectButton = 4;
                });
                questionsProvider.setValuePickedSlider(4, widget.index, '');
              },
              icon: const Icon(Icons.sentiment_very_satisfied_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
