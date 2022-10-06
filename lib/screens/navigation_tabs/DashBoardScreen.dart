import 'package:flutter/material.dart';

import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/Controller/ArticlesData.dart';
import 'package:weightchopper_flutter_project/Controller/HomePageData.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/screens/articles_screens/ArticleDetails.dart';
import 'package:weightchopper_flutter_project/screens/articles_screens/ArticlesScreen.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/ActiveRunning.dart';
import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/DietTabView.dart';
import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/FavouriteInnerTab.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/GetUpGoUp.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/RunningTab.dart';
import 'package:weightchopper_flutter_project/screens/mind_screens/ForestView.dart';
import 'package:weightchopper_flutter_project/screens/mind_screens/MeditationView.dart';
import 'package:weightchopper_flutter_project/screens/mind_screens/MindTabView.dart';
import 'package:weightchopper_flutter_project/screens/navigation_tabs/homepage/HomePageMiddle.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';
import 'package:weightchopper_flutter_project/widget/SizeConfig.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // getApiData();
    super.initState();
  }

  var quotation =
      "As they say it's all in the mind. the better the mind state more likely you succeed";
  var esterik = "*";
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
            labelPadding: EdgeInsets.only(left: MySize.size4!),
            indicatorColor: const Color(0xff4885ED),
            labelColor: const Color(0xff4885ED),
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.black87,
            tabs: const [
              Tab(
                text: 'Today',
              ),
              Tab(text: 'Diet'),
              Tab(text: 'Exercise'),
              Tab(text: 'Mind'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Divider(),
            Expanded(
                child: TabBarView(
              children: [
                homePageBody(),
                const DietTabView(),
                const RunningTabView(),
                const MindTabView(),
              ],
            ))
          ],
        ),
      ),
    );
  }

// ############################ APP BAR VIEW #################################

  Widget appBarView() {
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      bottom: TabBar(
        labelPadding: EdgeInsets.only(left: MySize.size4!),
        indicatorColor: const Color(0xff4885ED),
        labelColor: const Color(0xff4885ED),
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: Colors.black87,
        tabs: const [
          Tab(
            text: 'Today',
          ),
          Tab(text: 'Diet'),
          Tab(text: 'Exercise'),
          Tab(text: 'Mind'),
        ],
      ),
    );
  }

// ############################{{{ MAIN HOME PAGE SECTION }}} #################################

  Widget homePageBody() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profileSection(),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  SizedBox(height: MySize.size16),
                  goalFoodExerciseCaloriesView(),

                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 4,
                  ),

                  const HomePageMiddle(),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 2,
                  ),

                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 4,
                  ),
                  quotationSection(),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 5,
                  ),

                  workoutSection(),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 2,
                  ),
                  // psychologicalSectionView(),
                  // // SizedBox(
                  // //   height: SizeConfig.safeBlockVertical! * 2,
                  // // ),
                  psychologicalSection(),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 2,
                  ),
                  blogSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// ############################ BLOG SECTION #################################

  Widget blogSection() {
    return Padding(
      padding: EdgeInsets.only(
          left: MySize.size6, bottom: MySize.size30!, right: MySize.size14!),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: MySize.size8, bottom: MySize.size10!),
                child: DDText(
                  title: "Todays Read",
                  size: MySize.size14!,
                ),
              ),
              GestureDetector(
                onTap: () {
                  var route = MaterialPageRoute(
                      builder: (context) => const ArticlesScreen());
                  Navigator.push(context, route);
                },
                child: Container(
                  // color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.only(
                      // left: MySize.size14!,
                      bottom: MySize.size10!,
                    ),
                    child: DDText(
                      title: "Discover more",
                      size: MySize.size14!,
                      color: const Color(0xff4885ED),
                      weight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: articlesData.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ArticleDetails(
                      heading: articlesData[i]["heading"],
                      details: articlesData[i]["details"],
                      imageUrl: articlesData[i]["imageUrl"],
                    );
                  }));
                },
                child: Card(
                  margin: EdgeInsets.only(
                    left: MySize.size10!,
                    top: MySize.size5!,
                    bottom: MySize.size5!,
                  ),
                  elevation: 0,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[100]!,
                                  spreadRadius: 1,
                                  blurRadius: 0.2)
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(
                                    top: MySize.size8,
                                    // bottom: MySize.size8,
                                    left: MySize.size8,
                                    right: MySize.size28!),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: MySize.size8),
                                      child: DDText(
                                        line: 3,
                                        title: articlesData[i]["heading"],
                                        weight: FontWeight.w500,
                                        center: null,
                                        size: 15,
                                      ),
                                    ),
                                    // Container(
                                    //   padding: EdgeInsets.only(
                                    //       left: MySize.size10!,
                                    //       top: MySize.size10!,
                                    //       bottom: MySize.size10!,
                                    //       right: MySize.size10!),
                                    //   child: DDText(
                                    //     size: 10,
                                    //     title:
                                    //         "In at laculis lorem. Parsent tempor dictum tellus ut mlestile. Sed Sed ullamcorper lorem, id faucibus odiio. Duis eu nisi ut ligula cursus molestile at at dolor. Nulla est justo",
                                    //     // textAlign: TextAlign.left,
                                    //     toverflow: TextOverflow.ellipsis,
                                    //     center: null,
                                    //     color: Color(0xff797A7A),
                                    //     line: 2,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )),
                              Container(
                                height: MySize.size100!,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          articlesData[i]["imageUrl"],
                                        ),
                                        scale: 4,
                                        fit: BoxFit.fitHeight)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

// ############################ PSYCHOLOGICAL SECTION #################################

  Widget psychologicalSection() {
    List psychologicalData = [
      {
        "title": "Cognitive Behavior Therapy",
        "subtitle": "Healthy mind healthy you",
        "icon": "assets/images/meditation.png",
        "route": const ForestView()
      },
      {
        "title": "Meditation",
        "subtitle": "7 exercises",
        "icon": "assets/images/exercise.png",
        "route": const MeditationViewMind()
      },
    ];

    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MySize.size300!,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: MySize.size7!,
            mainAxisSpacing: MySize.size100!),
        itemCount: psychologicalData.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return psychologicalData[index]["route"];
              }));
            },
            child: Container(
              margin: index == 0
                  ? EdgeInsets.only(
                      left: MySize.size14!,
                      // right: MySize.size5!,
                    )
                  : EdgeInsets.only(right: MySize.size14!),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xffDFDFDF),
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: MySize.size10!,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      psychologicalData[index]["icon"],
                      // width: index == 4 ? 300 : 200,
                      // height: index == 4 ? 300 : 200,
                    ),
                    index % 2 == 0
                        ? SizedBox(
                            height: MySize.size15,
                          )
                        : SizedBox(
                            height: MySize.size15,
                          ),
                    GestureDetector(
                      child: SizedBox(
                        // padding: EdgeInsets.only(left: 10),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DDText(
                              title: psychologicalData[index]["title"],
                              center: true,
                              size: MySize.size11,
                              weight: FontWeight.w600,
                            ),
                            index == 0
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 3.0),
                                        child: DDText(
                                          title: psychologicalData[index]
                                              ["subtitle"],
                                          center: true,
                                          size: MySize.size11,
                                          weight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      DDText(
                                        title: psychologicalData[index]
                                            ["subtitle"],
                                        center: true,
                                        size: MySize.size11,
                                        weight: FontWeight.w300,
                                      ),
                                      SizedBox(
                                        width: MySize.size4!,
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: const Text(
                                          "*",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      const Text(
                                        "10 min",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

// ############################ WORKOUT SECTION #################################

  Widget workoutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: MySize.size18!),
          child: DDText(
            title: "Todays Workout",
            size: MySize.size12,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {});
                            // initialIndex = 0;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const GetUpGoUp(),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/images/run3.png',
                              width: double.infinity,
                              height: MySize.size120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Get Up Go Up",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "10 Exercises",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(
                                          width: MySize.size4!,
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: const Text(
                                            "*",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                        const Text(
                                          "5 sets",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.0, right: MySize.size10!),
                                    child: Row(
                                      children: const [
                                        Text(
                                          "200",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          "cal",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          // initialIndex = 0;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ActiveRunning(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/images/run2.png',
                            width: double.infinity,
                            height: MySize.size120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Sprint",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "10 Exercises",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(
                                        width: MySize.size4!,
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: const Text(
                                          "*",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      const Text(
                                        "5 sets",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(child: Container()),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 5.0, right: MySize.size10!),
                                  child: Row(
                                    children: const [
                                      Text(
                                        "200",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        "cal",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

// ############################ PROFILE SECTION #################################

  Container profileSection() {
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.only(
          left: MySize.size16!, top: MySize.size20!, right: MySize.size20!),
      child: Row(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile3.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(left: MySize.size6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DDText(
                      title: "Don Watson",
                      size: MySize.size13,
                    ),
                    DDText(
                      title: "Streak Day 4",
                      size: MySize.size11,
                      color: Colors.grey,
                      weight: FontWeight.w300,
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const FavouriteTabInnerPage();
              }));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(""),
                Padding(
                  padding: EdgeInsets.only(bottom: MySize.size14!),
                  child: Row(
                    children: [
                      DDText(
                        title: "My Favourites",
                        size: MySize.size13,
                      ),
                      SizedBox(
                        width: MySize.size4!,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Image.asset(
                          "assets/icons/heart_my_favourite.png",
                          width: 10,
                          height: 10,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

// ############################ FUNCTION FOR API HANDLING #################################

  // getApiData() async {
  //   final provider = Provider.of<DashboardProvider>(context, listen: false);

  //   String url = BASE_URL + "dashboard/28";

  //   var response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     DashboardModel model = DashboardModel.fromJson(jsonDecode(response.body));

  //     provider.setDashboardModel(model);

  //     print(IMAGES_URL + model.blogs[0].fileName);
  //   }
  // }

}
