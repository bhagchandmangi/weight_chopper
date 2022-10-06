import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/AddDietCustomPlan.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomAppBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

import 'package:weightchopper_flutter_project/widget/circlechartwidget.dart';

class AddDietFoodScreen extends StatefulWidget {
  @override
  _AddDietFoodScreenState createState() => _AddDietFoodScreenState();
}

class _AddDietFoodScreenState extends State<AddDietFoodScreen> {
  TextEditingController noOfServingsController = TextEditingController();

  TextEditingController servingSizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          shape: const CircularNotchedRectangle(),
          notchMargin: MySize.size10!,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MySize.size20!),
                  topRight: Radius.circular(MySize.size20!)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: MySize.size2!,
                  offset: const Offset(
                    0,
                    0,
                  ), // Shadow position
                ),
              ],
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MaterialButton(
                    minWidth: MySize.size50,
                    onPressed: () {
                      setState(
                        () {
                          // currentScreen = DashboardScreen();
                          // _selectedIndex = 0;
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MySize.size4!, left: MySize.size6),
                      child: Image.asset(
                        "assets/icons/home.png",
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    minWidth: MySize.size50,
                    onPressed: () {
                      setState(
                        () {
                          // _selectedIndex = 1;
                          // currentScreen = DiaryView();
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: MySize.size4!),
                      child: Image.asset(
                        "assets/icons/diaryy.png",
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    hoverColor: Colors.transparent,
                    minWidth: MySize.size50,
                    onPressed: () {
                      setState(
                        () {
                          // _selectedIndex = 2;
                          // currentScreen = LiveTrackingView();
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: MySize.size4!),
                      child: Image.asset(
                        "assets/icons/watch.png",
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    minWidth: MySize.size50,
                    onPressed: () {
                      setState(
                        () {
                          // currentScreen = FavouriteTabInnerPage();
                          // _selectedIndex = 3;
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: MySize.size4!),
                      child: Icon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(MySize.size8),
                  child: Container(
                    width: MySize.size44,
                    height: MySize.size44,
                    decoration: BoxDecoration(
                      color: const Color(0xff4885ED),
                      border: Border.all(
                        color: const Color(0xff4885ED),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(MySize.size30!),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        print("add pressed");
                        setState(
                          () {
                            // _selectedIndex = 4;
                          },
                        );
                      },
                      icon: const Icon(
                        MdiIcons.plus,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        drawer: const CustomDrawer(),
        appBar: customAppBar(context),
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Padding(
                  padding: EdgeInsets.all(11.0),
                  child: Text('Food'),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                upperContainer(context),
                SizedBox(
                  height: size.height * 0.02,
                ),
                middleContainer(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                bottomContainer(),
                SizedBox(
                  height: size.height * 0.06,
                ),

                // ############################# ADD FOOD BUTTON ############################
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddDietCustomPlan()),
                    );
                  },
                  child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: primaryColor),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 11, right: 11, top: 10, bottom: 8),
                          child: Text(
                            'Add Food',
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// ############################ UPPER CONTAINER VIEW ##################################

  upperContainer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: darkGrey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8, top: 15),
            child: Text('Russian Salad', style: style1),
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.02,
              ),
              SizedBox(
                width: 110,
                child: Stack(
                  children: [
                    Graph(),
                    Positioned(
                        right: 0,
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "320",
                              style: style.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor,
                                  fontSize: 19),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Cal',
                              style: style.copyWith(fontSize: 14),
                            ),
                          ],
                        ))),
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: LinearPercentIndicator(
                              width: 80.0,
                              lineHeight: 7.0,
                              percent: 0.4,
                              linearStrokeCap: LinearStrokeCap.butt,
                              backgroundColor: Colors.grey[300],
                              progressColor: secondaryColor,
                            ),
                          ),
                          Text(
                            '11%',
                            style:
                                style.copyWith(color: darkColor, fontSize: 11),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "17.2g",
                            style: style.copyWith(
                                fontWeight: FontWeight.w600,
                                color: secondaryColor),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Carb',
                            style: style.copyWith(color: darkColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: LinearPercentIndicator(
                              width: 80.0,
                              lineHeight: 7.0,
                              percent: 0.13,
                              linearStrokeCap: LinearStrokeCap.butt,
                              backgroundColor: Colors.grey[300],
                              progressColor: redColor,
                            ),
                          ),
                          Text(
                            '02%',
                            style:
                                style.copyWith(fontSize: 11, color: darkColor),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "55.5g",
                            style: style.copyWith(
                                fontWeight: FontWeight.w600, color: redColor),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Fat',
                            style: style.copyWith(color: darkColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: LinearPercentIndicator(
                              width: 80.0,
                              lineHeight: 7.0,
                              percent: 0.7,
                              linearStrokeCap: LinearStrokeCap.butt,
                              backgroundColor: Colors.grey[300],
                              progressColor: primaryColor,
                            ),
                          ),
                          Text(
                            '87%',
                            style:
                                style.copyWith(fontSize: 11, color: darkColor),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "18.9",
                            style: style.copyWith(
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Protein',
                            style: style.copyWith(color: darkColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
            ],
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 8),
            child: Text('      This food is high in vitamins',
                style: style.copyWith(color: redColor, fontSize: 10)),
          )),
        ],
      ),
    );
  }

// ############################ MIDDLE CONTAINER VIEW ##################################

  middleContainer() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: darkGrey.withOpacity(0.1)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 9,
                  child: Text(
                    'Number of servings',
                    style: style.copyWith(fontSize: 15),
                  ),
                ),
                Expanded(
                    child: TextField(
                  controller: noOfServingsController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '1',
                    hintStyle: style1.copyWith(color: primaryColor),
                  ),
                  style: style1.copyWith(color: primaryColor),
                )),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: darkGrey.withOpacity(0.1),
              ),
              right: BorderSide(
                color: darkGrey.withOpacity(0.1),
              ),
              bottom: BorderSide(
                color: darkGrey.withOpacity(0.1),
              ),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    'Servings Size',
                    style: style.copyWith(fontSize: 15),
                  ),
                ),
                Expanded(
                    child: TextField(
                  controller: servingSizeController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '354',
                    hintStyle: style1.copyWith(color: primaryColor),
                  ),
                  style: style1.copyWith(color: primaryColor),
                )),
                Text(' grams', style: style.copyWith(color: primaryColor)),
              ],
            ),
          ),
        ),
      ],
    );
  }

// ############################ BOTTOM CONTAINER VIEW ##################################

  bottomContainer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: darkGrey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8, top: 15),
            child: Text('Percent From Your Daily Budget',
                style: style.copyWith(fontSize: 15)),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: Text(
                          'Calories',
                          style: style.copyWith(color: darkColor),
                        ),
                      ),
                      LinearPercentIndicator(
                        lineHeight: 7.0,
                        percent: 0.6,
                        linearStrokeCap: LinearStrokeCap.butt,
                        backgroundColor: Colors.grey[300],
                        progressColor: primaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '34%',
                              style: style.copyWith(color: primaryColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "450g",
                              style: style.copyWith(
                                  fontSize: 12, color: darkColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: Text(
                          'Carbs',
                          style: style.copyWith(color: darkColor),
                        ),
                      ),
                      LinearPercentIndicator(
                        lineHeight: 7.0,
                        percent: 0.56,
                        linearStrokeCap: LinearStrokeCap.butt,
                        backgroundColor: Colors.grey[300],
                        progressColor: secondaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '34%',
                              style: style.copyWith(color: secondaryColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "150g",
                              style: style.copyWith(
                                  fontSize: 12, color: darkColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: Text(
                          'Fat',
                          style: style.copyWith(color: darkColor),
                        ),
                      ),
                      LinearPercentIndicator(
                        lineHeight: 7.0,
                        percent: 0.3,
                        linearStrokeCap: LinearStrokeCap.butt,
                        backgroundColor: Colors.grey[300],
                        progressColor: redColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '15%',
                              style: style.copyWith(color: redColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "100g",
                              style: style.copyWith(
                                  fontSize: 12, color: darkColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: Text(
                          'Protein',
                          style: style.copyWith(color: darkColor),
                        ),
                      ),
                      LinearPercentIndicator(
                        lineHeight: 7.0,
                        percent: 0.57,
                        linearStrokeCap: LinearStrokeCap.butt,
                        backgroundColor: Colors.grey[300],
                        progressColor: primaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '43%',
                              style: style.copyWith(color: primaryColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "10g",
                              style: style.copyWith(
                                  fontSize: 12, color: darkColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
