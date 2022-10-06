import 'package:get/get.dart';
import '../Service/BaseService.dart';
import '../Model/DashboardModel.dart';

class DashboardController extends GetxController{
  static DashboardController get i => Get.find();

  var data=Dashboard().obs;

  @override
  void onInit() { // called immediately after the widget is allocated memory
    getDashboardData();
    super.onInit();
  }

  Future<void> getDashboardData() async {
    data.value=Dashboard.fromJson(await BaseService().baseGetAPI("api/dashboard/28"));
    print(data.toJson());
  }
}