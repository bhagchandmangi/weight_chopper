import 'package:get/get.dart';

import 'package:weightchopper_flutter_project/utils/ColorConfig.dart';

class DDToast {
  ColorConfig colors = ColorConfig();
  void showToast(String title, String body, bool error) {
    Get.showSnackbar(GetBar(
      title: title,
      message: body,
      backgroundColor: error ? colors.errorColor : colors.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
    ));
  }
}
