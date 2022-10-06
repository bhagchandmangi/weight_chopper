import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/WeightDetails.dart';
import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/DietTabView.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/RunningTab.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/NutritionInnerTab.dart';
import 'package:weightchopper_flutter_project/screens/mind_screens/MindTabView.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CircleButton.dart';
import 'package:weightchopper_flutter_project/widget/CustomAppBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class NutritionScreenView extends StatefulWidget {
  @override
  _NutritionScreenViewState createState() => _NutritionScreenViewState();
}

class _NutritionScreenViewState extends State<NutritionScreenView>
    with TickerProviderStateMixin {
  TabController? _tabBarController;
  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Today',
    ),
    const Tab(text: 'Diet'),
    const Tab(text: 'Exercise'),
    const Tab(text: 'Mind')
  ];

  var _indexOfTab = 0;
  @override
  void initState() {
    _tabBarController = TabController(vsync: this, length: myTabs.length);

    print(_tabBarController!.length);
    // print(DefaultTabController.of(context).index);
    super.initState();
  }

  var dropvalue = "Daily";

  Map<String, double> dataMap = {
    "Flutter": 36,
    "React": 45,
    "Xamarin": 19,
  };
  List<Color> colorList = [
    const Color(0xff0ABFC8),
    const Color(0xffA954B1),
    const Color(0xffE55864),
  ];

  // LegendPosition _legendPosition = LegendPosition.bottom;

  int indexOfTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: customAppBar(
          context,
          elevation: 0.5,
          tabBar: TabBar(
              onTap: (index) {
                setState(() {
                  _indexOfTab = index;
                });
                print(indexOfTab);
              },
              controller: _tabBarController,
              labelPadding: EdgeInsets.only(left: MySize.size4!),
              indicatorColor: _indexOfTab == 0
                  ? Colors.transparent
                  : _indexOfTab == 1
                      ? Colors.blue
                      : Colors.blue,
              labelColor:
                  _indexOfTab == 0 ? Colors.black : const Color(0xff4885ED),
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.black87,
              tabs: myTabs),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: _tabBarController,
          children: const [
            NutritionInnerTab(),
            DietTabView(),
            RunningTabView(),
            MindTabView(),
          ],
        ),
      ),
    );
  }
}
