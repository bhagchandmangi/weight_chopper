import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/Controller/HomePageData.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/food_screens/SearchFood.dart';

class HomePageMiddle extends StatefulWidget {
  const HomePageMiddle({Key? key}) : super(key: key);

  @override
  _HomePageMiddleState createState() => _HomePageMiddleState();
}

class _HomePageMiddleState extends State<HomePageMiddle> {
  @override
  Widget build(BuildContext context) {
    // double height =
    //     MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double heightOfTabBar = MediaQuery.of(context).size.height * 0.04;
    return Container(
      // margin: EdgeInsets.only(left: MySize.size16!, right: MySize.size8),
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Center(
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: MySize.size22!),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        SizedBox(
                          // decoration: BoxDecoration(
                          //   border: Border(
                          //     bottom: BorderSide(
                          //       color: Colors.grey[100],
                          //     ),
                          //   ),
                          // ),
                          height: heightOfTabBar,
                          child: TabBar(
                            // controller: _controller,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 2.2, color: Colors.blue),
                              ),
                            ),
                            /*indicator:  UnderlineTabIndicator(
                            borderSide: BorderSide(width: 0.0,color: Colors.white),
                            insets: EdgeInsets.symmetric(horizontal:16.0)
                        ),*/
                            labelColor: Colors.blue,
                            labelStyle: GoogleFonts.openSans(
                                fontSize: 12, fontWeight: FontWeight.w500),
                            unselectedLabelColor: Colors.grey,
                            tabs: const [
                              Tab(text: 'Breakfast'),
                              Tab(text: 'Snacks'),
                              Tab(text: 'Lunch'),
                              Tab(text: 'Dinner'),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size22!, right: MySize.size28!),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[100]!,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          // color: Colors.red,
                          height: MySize.size230,
                          child: TabBarView(
                            // controller: _controller,
                            children: <Widget>[
                              //Breakfast tab
                              Container(
                                padding: EdgeInsets.only(
                                  top: MySize.size30!,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: MySize.size4!,
                                          left: MySize.size6),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Breakfast",
                                                  imageUrl:
                                                      "assets/images/diet2.jpg",
                                                  quantity: "250 grams",
                                                  calories: "200 cal");
                                            },
                                            child: foodItemLeft(
                                                "assets/images/oats.png",
                                                "Breakfast",
                                                "250 grams",
                                                "200 cal"),
                                          ),
                                          SizedBox(
                                            height: MySize.size10!,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Green tea",
                                                  imageUrl:
                                                      "assets/images/diet1.png",
                                                  quantity: "250 grams",
                                                  calories: "200 cal");
                                            },
                                            child: foodItemLeft(
                                                "assets/images/green_tea.png",
                                                "Green tea",
                                                "250 grams",
                                                "200 cal"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    addFoodDivider(),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: MySize.size16!,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Eggs",
                                                  imageUrl:
                                                      "assets/images/diet3.jpg",
                                                  quantity: "2 unit",
                                                  calories: "120 cal");
                                            },
                                            child: foodItemRight(
                                                "assets/images/eggs.png",
                                                "Eggs",
                                                "2 unit",
                                                "120 cal"),
                                          ),
                                          SizedBox(
                                            height: MySize.size10!,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Water",
                                                  imageUrl:
                                                      "assets/images/diet4.jpg",
                                                  quantity: "8 cups",
                                                  calories: "- -");
                                            },
                                            child: foodItemRight(
                                                "assets/images/water.png",
                                                "Water",
                                                "8 cups",
                                                "- -"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Snacks View
                              Container(
                                padding: EdgeInsets.only(
                                  top: MySize.size30!,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: MySize.size4!,
                                          left: MySize.size6),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Snacks",
                                                  imageUrl:
                                                      "assets/images/diet2.jpg",
                                                  quantity: "250 grams",
                                                  calories: "200 cal");
                                            },
                                            child: foodItemLeft(
                                                "assets/images/oats.png",
                                                "Snacks",
                                                "250 grams",
                                                "200 cal"),
                                          ),
                                          SizedBox(
                                            height: MySize.size10!,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Green tea",
                                                  imageUrl:
                                                      "assets/images/diet1.png",
                                                  quantity: "250 grams",
                                                  calories: "200 cal");
                                            },
                                            child: foodItemLeft(
                                                "assets/images/green_tea.png",
                                                "Green tea",
                                                "250 grams",
                                                "200 cal"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    addFoodDivider(),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: MySize.size16!,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Eggs",
                                                  imageUrl:
                                                      "assets/images/diet3.jpg",
                                                  quantity: "2 unit",
                                                  calories: "120 cal");
                                            },
                                            child: foodItemRight(
                                                "assets/images/eggs.png",
                                                "Eggs",
                                                "2 unit",
                                                "120 cal"),
                                          ),
                                          SizedBox(
                                            height: MySize.size10!,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Water",
                                                  imageUrl:
                                                      "assets/images/diet4.jpg",
                                                  quantity: "8 cups",
                                                  calories: "- -");
                                            },
                                            child: foodItemRight(
                                                "assets/images/water.png",
                                                "Water",
                                                "8 cups",
                                                "- -"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //Lunch tab
                              Container(
                                padding: EdgeInsets.only(
                                  top: MySize.size30!,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: MySize.size4!,
                                          left: MySize.size6),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Lunch",
                                                  imageUrl:
                                                      "assets/images/diet2.jpg",
                                                  quantity: "250 grams",
                                                  calories: "200 cal");
                                            },
                                            child: foodItemLeft(
                                                "assets/images/oats.png",
                                                "Lunch",
                                                "250 grams",
                                                "200 cal"),
                                          ),
                                          SizedBox(
                                            height: MySize.size10!,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Green tea",
                                                  imageUrl:
                                                      "assets/images/diet1.png",
                                                  quantity: "250 grams",
                                                  calories: "200 cal");
                                            },
                                            child: foodItemLeft(
                                                "assets/images/green_tea.png",
                                                "Green tea",
                                                "250 grams",
                                                "200 cal"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    addFoodDivider(),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: MySize.size16!,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Eggs",
                                                  imageUrl:
                                                      "assets/images/diet3.jpg",
                                                  quantity: "2 unit",
                                                  calories: "120 cal");
                                            },
                                            child: foodItemRight(
                                                "assets/images/eggs.png",
                                                "Eggs",
                                                "2 unit",
                                                "120 cal"),
                                          ),
                                          SizedBox(
                                            height: MySize.size10!,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Water",
                                                  imageUrl:
                                                      "assets/images/diet4.jpg",
                                                  quantity: "8 cups",
                                                  calories: "- -");
                                            },
                                            child: foodItemRight(
                                                "assets/images/water.png",
                                                "Water",
                                                "8 cups",
                                                "- -"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //Dinner tab
                              Container(
                                padding: EdgeInsets.only(
                                  top: MySize.size30!,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: MySize.size4!,
                                          left: MySize.size6),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Dinner",
                                                  imageUrl:
                                                      "assets/images/diet2.jpg",
                                                  quantity: "250 grams",
                                                  calories: "200 cal");
                                            },
                                            child: foodItemLeft(
                                                "assets/images/oats.png",
                                                "Dinner",
                                                "250 grams",
                                                "200 cal"),
                                          ),
                                          SizedBox(
                                            height: MySize.size10!,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Green tea",
                                                  imageUrl:
                                                      "assets/images/diet1.png",
                                                  quantity: "250 grams",
                                                  calories: "200 cal");
                                            },
                                            child: foodItemLeft(
                                                "assets/images/green_tea.png",
                                                "Green tea",
                                                "250 grams",
                                                "200 cal"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    addFoodDivider(),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: MySize.size16!,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Eggs",
                                                  imageUrl:
                                                      "assets/images/diet3.jpg",
                                                  quantity: "2 unit",
                                                  calories: "120 cal");
                                            },
                                            child: foodItemRight(
                                                "assets/images/eggs.png",
                                                "Eggs",
                                                "2 unit",
                                                "120 cal"),
                                          ),
                                          SizedBox(
                                            height: MySize.size10!,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _showFoodDialog(
                                                  title: "Water",
                                                  imageUrl:
                                                      "assets/images/diet4.jpg",
                                                  quantity: "8 cups",
                                                  calories: "- -");
                                            },
                                            child: foodItemRight(
                                                "assets/images/water.png",
                                                "Water",
                                                "8 cups",
                                                "- -"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showFoodDialog({title, imageUrl, quantity, calories}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              insetAnimationDuration: const Duration(seconds: 1),
              insetAnimationCurve: Curves.fastOutSlowIn,
              elevation: 2,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(imageUrl))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      Text(
                                        quantity,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Text(
                                    calories,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 0.3,
                              ),
                              const Text(
                                "Recipe",
                                style: TextStyle(color: Colors.black),
                              ),
                              const Text(
                                "1 cup fat free milk",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              const Text(
                                "1 cup oats",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              const Text(
                                "1 tbsp chopped walnuts",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              bottom: MySize.size10!,
                              left: MySize.size10!,
                              right: MySize.size10!),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // padding: EdgeInsets.only(
                                //     bottom: MySize.size10!, left: MySize.size10!),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: DDText(
                                    title: "Replace Food",
                                    size: MySize.size14,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: DDText(
                                  title: "Add Food",
                                  size: MySize.size14,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
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
