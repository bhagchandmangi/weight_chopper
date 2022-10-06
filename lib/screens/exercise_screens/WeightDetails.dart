import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/LineChartSyncFusion.dart';

// ignore: unused_import
import 'package:weightchopper_flutter_project/widget/CustomAppBar.dart';

class WeightDetails extends StatefulWidget {
  const WeightDetails({Key? key}) : super(key: key);

  @override
  _WeightDetailsState createState() => _WeightDetailsState();
}

class _WeightDetailsState extends State<WeightDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        // SizedBox(
                        //   height: MySize.size26,
                        // ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MySize.size14!,
                            bottom: MySize.size20!,
                            top: MySize.size30!,
                          ),
                          child: Row(
                            children: [
                              DDText(
                                title: "Weight Tracker",
                                size: MySize.size11,
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: 2, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey[100]!),
                            ),
                            height: 200,
                            child: LineChartSyncFusion()),
                        SizedBox(
                          height: MySize.size40,
                        ),

                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[100]!)),
                          padding: EdgeInsets.all(MySize.size20!),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MySize.size14!),
                                      child:
                                          Image.asset("assets/icons/start.png"),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DDText(
                                          title: "Starting Weight",
                                          size: 11,
                                        ),
                                        DDText(
                                          title: "90 kg",
                                          size: 15,
                                          weight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              DDText(
                                title: "Taken: 06/24/2021",
                                size: 11,
                                color: const Color(0xff797A7A),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: MySize.size20!),

                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[100]!)),
                            padding: EdgeInsets.all(MySize.size20!),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MySize.size14!),
                                      child:
                                          Image.asset("assets/icons/date.png"),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DDText(
                                          title: "Current Weight",
                                          size: 11,
                                        ),
                                        DDText(
                                          title: "85 kg",
                                          size: 15,
                                          weight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                DDText(
                                  title: "Today: 06/24/2021",
                                  size: 11,
                                  color: const Color(0xff797A7A),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: MySize.size20!),
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[100]!)),
                            padding: EdgeInsets.all(MySize.size20!),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: MySize.size14!,
                                      ),
                                      child:
                                          Image.asset("assets/icons/goal.png"),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DDText(
                                          title: "Goal Weight",
                                          size: 11,
                                        ),
                                        DDText(
                                          title: "80 kg",
                                          size: 15,
                                          weight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                DDText(
                                  title: "Achieved: 05 kg to go",
                                  size: 11,
                                  color: const Color(0xff797A7A),
                                )
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
          ),
        ],
      ),
    );
  }
}
