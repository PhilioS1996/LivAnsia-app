import 'package:livansia_app/pages/first_page.dart';
import 'package:livansia_app/pages/wrapper.dart';

import '../helpers/imports.dart';

class StreamAuthPage extends StatefulWidget {
  const StreamAuthPage({Key? key}) : super(key: key);

  @override
  State<StreamAuthPage> createState() => _StreamAuthPageState();
}

class _StreamAuthPageState extends State<StreamAuthPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SnackBar(content: Text('Error'));
          } else if (snapshot.hasData) {
            return Wrapper(apoPou: false);
          } else {
            return const FirstScreen();
          }
        });
  }
}
