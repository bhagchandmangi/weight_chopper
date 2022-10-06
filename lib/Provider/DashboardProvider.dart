import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/models/DashboardModel.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardModel? _dashboardModel;

  void setDashboardModel(DashboardModel model) {
    _dashboardModel = model;
    notifyListeners();
  }

  DashboardModel get dashboardModel => _dashboardModel!;
}
