import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weightchopper_flutter_project/Controller/MeditationListData.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';

class FavouriteDrawerTabScreen extends StatefulWidget {
  const FavouriteDrawerTabScreen({Key? key}) : super(key: key);

  @override
  _FavouriteDrawerTabScreenState createState() =>
      _FavouriteDrawerTabScreenState();
}

List<bool> days = [false, false, false, false, false, false, false];
Color selectedBgColor = Colors.blue;
Color selectedTextColor = Colors.white;
Color unSelectedBgColor = Colors.grey[300]!;
Color unSelectedTextColor = Colors.black;

bool myDietisFavourite = false;
bool myDietisAdded = false;

bool myWorkoutisFavourite = false;
bool myWorkoutisAdded = false;
TabController? _controller;

class _FavouriteDrawerTabScreenState extends State<FavouriteDrawerTabScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double heightOfTabBar = MediaQuery.of(context).size.height * 0.04;
    double heightOfBottomBar = MediaQuery.of(context).size.height * 0.07;
    double margin = height * 0.02;
    return SafeArea(
      child: Container(
        child: ListView(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: height * 0.25,
                child: Stack(
                  children: [
                    Image.asset(
                      // ############### for changing the image of tab ###############
                      // _activeTabIndex == 0
                      //     ? 'assets/images/cognitive_1.png'
                      //     : _activeTabIndex == 1
                      //         ? 'assets/images/cognitive_2.png'
                      //         : _activeTabIndex == 2
                      //             ? "assets/images/cognitive_3.png"
                      //             : "assets/images/1.png",
                      "assets/images/fav.png",
                      fit: BoxFit.cover,
                      height: height * 0.3,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    SizedBox(
                      height: heightOfTabBar,
                      child: TabBar(
                        controller: _controller,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 2.2, color: Colors.blue),
                          ),
                        ),
                        /*indicator:  UnderlineTabIndicator(
                              borderSide: BorderSide(width: 0.0,color: Colors.white),
                              insets: EdgeInsets.symmetric(horizontal:16.0)
                          ),*/
                        labelColor: Colors.blue,
                        labelStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(text: 'My Diets'),
                          Tab(text: 'Mind'),
                          Tab(text: 'My Workouts'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height -
                          (AppBar().preferredSize.height +
                              heightOfTabBar +
                              heightOfBottomBar),
                      child: TabBarView(
                        controller: _controller,
                        children: <Widget>[
                          //favourite diet tab
                          myDietSection(margin, height),
                          // Mind Tab View
                          mindSection(margin, height),

                          //favourite workout tab
                          myWorkoutsSection(margin, height),
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
    );
  }

  Container myWorkoutsSection(double margin, double height) {
    return Container(
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Container(
              padding:
                  EdgeInsets.only(left: MySize.size20!, right: MySize.size10!),
              // margin: EdgeInsets.fromLTRB(
              //     margin, 0, margin, margin),
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, margin, 0),
                              height: height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/1.png',
                                      ))),
                            ),
                            SizedBox(
                                height: height * 0.12,
                                width: MediaQuery.of(context).size.width -
                                    (MediaQuery.of(context).size.width * 0.3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Text(
                                            "Walk",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: const Text(
                                            "10 minutes",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.play_arrow,
                                          color: Colors.blue,
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "200 kcal",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  myWorkoutisFavourite =
                                                      !myWorkoutisFavourite;
                                                });
                                              },
                                              child: Icon(
                                                Icons.favorite,
                                                color:
                                                    myWorkoutisFavourite == true
                                                        ? Colors.red
                                                        : Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  myWorkoutisAdded =
                                                      !myWorkoutisAdded;
                                                });
                                              },
                                              child: Icon(
                                                myWorkoutisAdded == true
                                                    ? MdiIcons.minus
                                                    : MdiIcons.plus,
                                                color: Colors.blue,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }

  Container mindSection(double margin, double height) {
    return Container(
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Container(
              padding: EdgeInsets.only(left: MySize.size20!),
              // margin: EdgeInsets.fromLTRB(
              //     margin, 0, margin, margin),
              child: ListView.builder(
                itemCount: mindFavouriteInnerTabListdata.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, margin, 0),
                              height: height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    mindFavouriteInnerTabListdata[index]
                                        ["image"],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: height * 0.12,
                                width: MediaQuery.of(context).size.width -
                                    (MediaQuery.of(context).size.width * 0.3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          mindFavouriteInnerTabListdata[index]
                                              ["title"],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          mindFavouriteInnerTabListdata[index]
                                              ["subtitle"],
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const Icon(
                                          Icons.play_arrow,
                                          color: Colors.blue,
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  mindFavouriteInnerTabListdata[
                                                              index]
                                                          ["heartselected"] =
                                                      !mindFavouriteInnerTabListdata[
                                                              index]
                                                          ["heartselected"];

                                                  // isFavourite = !isFavourite;
                                                });
                                              },
                                              child: Icon(
                                                Icons.favorite,
                                                color: mindFavouriteInnerTabListdata[
                                                                index]
                                                            ["heartselected"] ==
                                                        true
                                                    ? Colors.red
                                                    : Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  mindFavouriteInnerTabListdata[
                                                              index]
                                                          ["foodAddselected"] =
                                                      !mindFavouriteInnerTabListdata[
                                                              index]
                                                          ["foodAddselected"];
                                                });
                                              },
                                              child: Icon(
                                                mindFavouriteInnerTabListdata[
                                                                index][
                                                            "foodAddselected"] ==
                                                        true
                                                    ? MdiIcons.minus
                                                    : MdiIcons.plus,
                                                color: Colors.blue,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.3,
                        )
                      ],
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }

  Container myDietSection(double margin, double height) {
    return Container(
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Container(
              padding:
                  EdgeInsets.only(left: MySize.size20!, right: MySize.size10!),
              // margin: EdgeInsets.fromLTRB(
              //     margin, 0, margin, margin),
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 10, margin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Morning",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                Text(
                                  "8:30",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            )),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, margin, 0),
                              height: height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/diet2.png',
                                      ))),
                            ),
                            SizedBox(
                                height: height * 0.12,
                                width: MediaQuery.of(context).size.width -
                                    (MediaQuery.of(context).size.width * 0.3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Oats",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const Text(
                                          "250 grams",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const Icon(
                                          Icons.play_arrow,
                                          color: Colors.blue,
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "200 kcal",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  myDietisFavourite =
                                                      !myDietisFavourite;
                                                });
                                              },
                                              child: Icon(
                                                Icons.favorite,
                                                color: myDietisFavourite == true
                                                    ? Colors.red
                                                    : Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  myDietisAdded =
                                                      !myDietisAdded;
                                                });
                                              },
                                              child: Icon(
                                                myDietisAdded == true
                                                    ? MdiIcons.minus
                                                    : MdiIcons.plus,
                                                color: Colors.blue,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.3,
                        )
                      ],
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
