import '../helpers/imports.dart';

class LoadingSpin extends StatelessWidget {
  const LoadingSpin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[50],
      child: Center(
        child: SpinKitDoubleBounce(
          color: Colors.deepPurple[100],
          size: 50.0,
        ),
      ),
    );
  }
}
