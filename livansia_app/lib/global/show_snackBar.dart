import '../helpers/imports.dart';

void showSnackbar(BuildContext context, String text,
    {Color color = Colors.red, Duration dur = const Duration(seconds: 4)}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: dur,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      content: Container(
          height: 25,
          child: Center(
              child: Text(text,
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.subtitle1!.fontSize,
                      color: Colors.white)))),
      backgroundColor: color,
    ),
  );
}
