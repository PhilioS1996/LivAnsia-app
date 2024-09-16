import 'package:livansia_app/helpers/imports.dart';

class UserProvider with ChangeNotifier {
  late Users userInstance;

  void setUsers(var userSign) {
    userInstance = userSign;
    notifyListeners();
  }
}
