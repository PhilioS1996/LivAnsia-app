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
      child: Stack(children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.indigo[300],
            ), // Replace with your desired icon
            onPressed: () {
              // Handle button press
              _showInfoSettings(context);
            },
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 10, left: 18, right: 18, bottom: 30),
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
                      focusNode: questionsProvider.focusNode1,
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
                      focusNode: questionsProvider.focusNode2,
                      textAlign: TextAlign.center,
                      controller: questionsProvider.appUseContr,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

void _showInfoSettings(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text(
        'Info',
        style: TextStyle(),
      ),
      content: RichText(
        text: const TextSpan(
            text:
                'Για να βρείτε τα στοιχεία του "Συνολικό Screen Time" και το ποιά εφαρμογή χρησιμοποιήθηκε περισσότερο μέσα στην ημέρα, περιηγηθείτε στο κινητό σας:\n',
            style: TextStyle(color: Colors.black, fontSize: 18),
            children: <TextSpan>[
              TextSpan(text: '\n'),
              TextSpan(
                text: ' Ρυθμίσεις -> Ψηφιακή Ευημερία & γονικός έλεγχος \n',
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
              ),
              TextSpan(
                text: ' ή \n',
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
              ),
              TextSpan(
                text: 'Settings -> Digital Wellbeing & parental controls\n ',
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
              ),
            ]),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo[300],
          ),
          child: const Text(
            'Εντάξει',
            // style: TextStyle(color: Colors.black87),
          ),
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        )
      ],
    ),
  );
}
