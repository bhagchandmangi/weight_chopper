import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomAppBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';
import 'package:weightchopper_flutter_project/widget/circlechartwidget.dart';

class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen>
    with TickerProviderStateMixin {
  TextEditingController noOfServingsController = TextEditingController();

  TextEditingController servingSizeController = TextEditingController();
  var dropvalue = "Daily";
  TabController? _tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Today',
    ),
    const Tab(text: 'Diet'),
    const Tab(text: 'Exercise'),
    const Tab(text: 'Mind'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController!.animateTo(3);
  }

  @override
  Widget build(BuildContext context) {
    var workList = ["Today", "Week", "Month"];

    int counter = 0;

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: const CustomStaticBottomNavigationBar(),
          drawer: const CustomDrawer(),
          appBar: customAppBar(
            context,
            elevation: 0.5,
            tabBar: TabBar(
              onTap: (index) {
                setState(() {
                  _tabController!.index = 3;
                });
              },
              controller: _tabController,
              labelPadding: EdgeInsets.only(left: MySize.size4!),
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.black87,
              tabs: myTabs,
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: size.height * 0.02,
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(11.0),
                //   child: Text('Food'),
                // ),
                // SizedBox(
                //   height: size.height * 0.04,
                // ),

                SizedBox(
                  height: MySize.size20!,
                ),
                Container(
                  // color: Colors.red,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: MySize.size26!),
                        child: DDText(
                            title: workList[counter],
                            size: MySize.size15,
                            color: const Color(0xff2B2B2B),
                            weight: FontWeight.w300),
                      ),
                      Expanded(flex: 1, child: Container()),
                      DropdownButton<String>(
                        isDense: true,
                        underline: const SizedBox(),
                        // isExpanded: true,
                        value: dropvalue,
                        items: <String>[
                          'Daily',
                          'Weekly',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: DDText(
                              title: value,
                              weight: FontWeight.w300,
                              size: MySize.size15,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropvalue = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MySize.size20!,
                ),
                upperContainer(context),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Divider(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                bottomContainer(),
                SizedBox(
                  height: size.height * 0.06,
                ),
                // Center(
                //   child: Container(
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20),
                //           color: primaryColor),
                //       child: Padding(
                //         padding: const EdgeInsets.only(
                //             left: 11, right: 11, top: 10, bottom: 8),
                //         child: Text(
                //           'Add Food',
                //           style: style.copyWith(
                //               color: Colors.white, fontWeight: FontWeight.w500),
                //         ),
                //       )),
                // ),
                // SizedBox(
                //   height: 70,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  upperContainer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 10, bottom: 8, top: 15),
          //   child: Text('Russian Salad', style: style1),
          // ),
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
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MySize.size8,
                                  // top: MySize.size8,
                                  right: MySize.size8),
                              child: Countup(
                                begin: 0,
                                end: 320,
                                duration: const Duration(seconds: 1),
                                style: GoogleFonts.openSans(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: MySize.size20!),
                              ),
                            ),
                            // SizedBox(
                            //   height: MySize.size2,
                            // ),
                            Text(
                              'Cal',
                              style: style.copyWith(fontSize: MySize.size13),
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
                              progressColor: const Color(0xffA954B1),
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
                            "85.7g",
                            style: style.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xffA954B1)),
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
        ],
      ),
    );
  }

  bottomContainer() {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(color: darkGrey.withOpacity(0.1)),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: MySize.size20!,
                              ),
                              child: Column(
                                children: [
                                  const Text(""),
                                  Image.asset("assets/icons/breakfast.png"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.only(
                                right: MySize.size30!,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 5, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DDText(
                                          title: 'Breakfast',
                                          size: MySize.size12,
                                        ),
                                        DDText(
                                          title: '127cal',
                                          size: MySize.size12,
                                        ),
                                        Text(
                                          "45%",
                                          style: style.copyWith(
                                              fontSize: 13,
                                              color: const Color(0xff0271BB),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  LinearPercentIndicator(
                                    lineHeight: 7.0,
                                    percent: 0.56,
                                    linearStrokeCap: LinearStrokeCap.butt,
                                    backgroundColor: Colors.grey[300],
                                    progressColor: const Color(0xff0271BB),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MySize.size44),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: MySize.size20!,
                              ),
                              child: Column(
                                children: [
                                  const Text(""),
                                  Image.asset("assets/icons/lunch.png"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.only(
                                right: MySize.size30!,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 5, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DDText(
                                          title: 'Lunch',
                                        ),
                                        DDText(
                                          title: '225cal',
                                          size: MySize.size12,
                                        ),
                                        Text(
                                          "19%",
                                          style: style.copyWith(
                                              fontSize: 12,
                                              color: const Color(0xffF5B302),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  LinearPercentIndicator(
                                    lineHeight: 7.0,
                                    percent: 0.56,
                                    linearStrokeCap: LinearStrokeCap.butt,
                                    backgroundColor: Colors.grey[300],
                                    progressColor: const Color(0xffF5B302),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MySize.size44,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: MySize.size20!,
                              ),
                              child: Column(
                                children: [
                                  const Text(""),
                                  Image.asset("assets/icons/dinner2.png"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.only(
                                right: MySize.size30!,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 5, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DDText(
                                          title: 'Dinner',
                                        ),
                                        DDText(
                                          title: '440cal',
                                          size: MySize.size12,
                                        ),
                                        Text(
                                          "36%",
                                          style: style.copyWith(
                                              fontSize: 12,
                                              color: const Color(0xffEB64BA),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  LinearPercentIndicator(
                                    lineHeight: 7.0,
                                    percent: 0.56,
                                    linearStrokeCap: LinearStrokeCap.butt,
                                    backgroundColor: Colors.grey[300],
                                    progressColor: const Color(0xffEB64BA),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MySize.size44,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: MySize.size20!,
                              ),
                              child: Column(
                                children: [
                                  const Text(""),
                                  Image.asset("assets/icons/snack.png"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.only(
                                right: MySize.size30!,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 5, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DDText(
                                          title: 'Snacks',
                                        ),
                                        DDText(
                                          title: '120cal',
                                          size: MySize.size12,
                                        ),
                                        Text(
                                          "0%",
                                          style: style.copyWith(
                                              fontSize: 12,
                                              color: const Color(0xff4985EE),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  LinearPercentIndicator(
                                    lineHeight: 7.0,
                                    percent: 0.56,
                                    linearStrokeCap: LinearStrokeCap.butt,
                                    backgroundColor: Colors.grey[300],
                                    progressColor: const Color(0xff4985EE),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MySize.size44,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: MySize.size20!,
                              ),
                              child: Column(
                                children: [
                                  const Text(""),
                                  Image.asset("assets/icons/fire.png"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.only(
                                right: MySize.size30!,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 5, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DDText(
                                          title: 'Burned',
                                        ),
                                        DDText(
                                          title: '300cal',
                                          size: MySize.size12,
                                        ),
                                        Text(
                                          "11%",
                                          style: style.copyWith(
                                              fontSize: 12,
                                              color: const Color(0xffEB8331),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  LinearPercentIndicator(
                                    lineHeight: 7.0,
                                    percent: 0.56,
                                    linearStrokeCap: LinearStrokeCap.butt,
                                    backgroundColor: Colors.grey[300],
                                    progressColor: const Color(0xffEB8331),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MySize.size44,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: MySize.size20!,
                              ),
                              child: Column(
                                children: [
                                  const Text(""),
                                  Image.asset("assets/icons/water2.png"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.only(
                                right: MySize.size30!,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 5, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DDText(
                                          title: 'Water',
                                        ),
                                        DDText(
                                          title: '10 cups',
                                        ),
                                        Text(
                                          "100%",
                                          style: style.copyWith(
                                              fontSize: 12,
                                              color: const Color(0xff4FC2E9),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  LinearPercentIndicator(
                                    lineHeight: 7.0,
                                    percent: 0.80,
                                    linearStrokeCap: LinearStrokeCap.butt,
                                    backgroundColor: Colors.grey[300],
                                    progressColor: const Color(0xff4FC2E9),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
