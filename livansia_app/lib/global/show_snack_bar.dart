import '../helpers/imports.dart';

void showSnackbar(BuildContext context, String text,
    {Color color = Colors.red, Duration dur = const Duration(seconds: 4)}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: dur,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      // ignore: sized_box_for_whitespace
      content: Container(
          height: 25,
          child: Center(
              child: Text(text,
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize,
                      color: Colors.white)))),
      backgroundColor: color,
    ),
  );
}
