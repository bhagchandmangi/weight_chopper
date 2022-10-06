import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/Controller/HomePageData.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/WeightDetails.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/NutritionScreen.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/SearchFood.dart';

class NutritionInnerTab extends StatefulWidget {
  const NutritionInnerTab({Key? key}) : super(key: key);

  @override
  _NutritionInnerTabState createState() => _NutritionInnerTabState();
}

class _NutritionInnerTabState extends State<NutritionInnerTab> {
  @override
  Widget build(BuildContext context) {
    // double height =
    //     MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double heightOfTabBar = MediaQuery.of(context).size.height * 0.035;
    return Container(
      // margin: EdgeInsets.only(left: MySize.size16, right: MySize.size8),
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Column(
          children: [
            SizedBox(
              height: MySize.size10,
            ),
            SizedBox(
              height: heightOfTabBar,
              child: const TabBar(
                indicatorColor: Color(0xff4885ED),
                labelColor: Color(0xff4885ED),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.black87,
                labelPadding: EdgeInsets.only(right: 4),
                labelStyle: TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                  fontFamily: "Open Sans",
                  fontWeight: FontWeight.w400,
                ),
                tabs: [
                  Tab(
                    text: "Nutrition",
                  ),
                  Tab(
                    text: "Weight Stats",
                  ),
                  Tab(
                    text: "Lorum",
                  ),
                  Tab(
                    text: "Lorum",
                  ),
                ],
              ),
            ),
            // Container(
            //   margin:
            //       EdgeInsets.only(left: MySize.size26, right: MySize.size26),
            //   decoration: BoxDecoration(
            //     border: Border(
            //       bottom: BorderSide(color: Colors.grey[300]),
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 2,
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: MySize.size22),
                child: const TabBarView(
                  // controller: _controller,
                  children: <Widget>[
                    NutritionScreen(),
                    WeightDetails(),
                    Center(child: Text("three")),
                    Center(child: Text("Four"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget addFoodDivider() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SearchFood();
        }));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 10, bottom: MySize.size30!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OutlinedDotIndicator(),
            const SizedBox(
              height: 30.0,
              child: SolidLineConnector(),
            ),
            DDText(
              title: "Add Food",
              size: MySize.size11,
              color: primaryColor,
            ),
            const SizedBox(
              height: 32.0,
              child: SolidLineConnector(),
            ),
            const OutlinedDotIndicator(),
          ],
        ),
      ),
    );
  }
}
