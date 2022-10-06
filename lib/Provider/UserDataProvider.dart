import 'package:flutter/cupertino.dart';
import 'package:weightchopper_flutter_project/Model/UserDataModel.dart';

class UserDataProvider extends ChangeNotifier {
  UserDataModel? userData;
  void setUserData(UserDataModel user) {
    print("Set userData is called");
    print("Calling Listeners");
    userData = user;
    notifyListeners();
    print("Called Listeners");
  }
}
