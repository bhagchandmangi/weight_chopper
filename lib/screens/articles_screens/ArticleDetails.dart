import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';
import 'package:weightchopper_flutter_project/widget/SizeConfig.dart';

class ArticleDetails extends StatefulWidget {
  final heading;
  final details;
  final imageUrl;
  const ArticleDetails({Key? key, this.heading, this.details, this.imageUrl})
      : super(key: key);

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails>
    with TickerProviderStateMixin {
  TabController? _tabController;
  bool isFavourite = false;
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: const CustomStaticBottomNavigationBar(),
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
            indicatorColor: const Color(0xff4885ED),
            labelColor: const Color(0xff4885ED),
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.black87,
            tabs: myTabs,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Container(
              padding: EdgeInsets.only(
                top: MySize.size14!,
                left: MySize.size14!,
                right: MySize.size14!,
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: MySize.size8,
                          right: MySize.size8,
                        ),
                        child: DDText(
                          title: widget.heading,
                          color: const Color(0xff23233C),
                          weight: FontWeight.bold,
                          size: 20,
                          line: 3,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: MySize.size8),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MySize.size10!,
                          ),
                          child: DDText(
                            title: "Published On",
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: Container(),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(top: MySize.size8),
                        child: Row(
                          children: [
                            DDText(
                              title: "29 Sept 2021 ",
                              color: Colors.grey[400],
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       isFavourite = !isFavourite;
                            //     });
                            //   },
                            //   child: Icon(
                            //     Icons.favorite,
                            //     color: isFavourite == true
                            //         ? Colors.red
                            //         : Colors.grey,
                            //     size: 16,
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MySize.size8, bottom: MySize.size8),
                        child: Image.asset(
                          widget.imageUrl,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MySize.size26!,
                            right: MySize.size10!,
                            left: MySize.size12!),
                        child: DDText(
                          title: widget.details,
                          color: const Color(0xff797A7A),
                          line: 4,
                        ),
                      ),
                      // Spacer(),
                      Container(
                        margin: EdgeInsets.only(
                          top: MySize.size26!,
                          bottom: MySize.size4!,
                          left: MySize.size16!,
                        ),
                        child: Row(
                          children: [
                            DDText(
                                title: "Read More",
                                size: MySize.size16,
                                weight: FontWeight.w500),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MySize.size20,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          right: MySize.size10!,
                          bottom: MySize.size10!,
                          left: MySize.size10!,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffEFEFEF),
                                spreadRadius: 1,
                                blurRadius: 0.2)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: MySize.size8),
                                    child: DDText(
                                      line: 3,
                                      title:
                                          "11 Exercises you can do at office in the Evening Routine",
                                      weight: FontWeight.w500,
                                      center: null,
                                      size: 15,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: MySize.size10!,
                                      top: MySize.size10!,
                                      bottom: MySize.size10!,
                                      right: MySize.size10!,
                                    ),
                                    child: DDText(
                                      size: 10,
                                      title:
                                          "In at laculis lorem. Parsent tempor dictum tellus ut mlestile. Sed Sed ullamcorper lorem, id faucibus odiio. Duis eu nisi ut ligula cursus molestile at at dolor. Nulla est justo",
                                      // textAlign: TextAlign.left,
                                      toverflow: TextOverflow.ellipsis,
                                      center: null,
                                      color: const Color(0xff797A7A),
                                      line: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: SizeConfig.safeBlockHorizontal! * 30,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/exercise.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          right: MySize.size10!,
                          bottom: MySize.size10!,
                          left: MySize.size10!,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffEFEFEF),
                                spreadRadius: 1,
                                blurRadius: 0.2)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: MySize.size8),
                                    child: DDText(
                                      line: 3,
                                      title:
                                          "12 Exercises you can do at home in the Morning Routine",
                                      weight: FontWeight.w500,
                                      center: null,
                                      size: 15,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: MySize.size10!,
                                      top: MySize.size10!,
                                      bottom: MySize.size10!,
                                      right: MySize.size10!,
                                    ),
                                    child: DDText(
                                      size: 10,
                                      title:
                                          "In at laculis lorem. Parsent tempor dictum tellus ut mlestile. Sed Sed ullamcorper lorem, id faucibus odiio. Duis eu nisi ut ligula cursus molestile at at dolor. Nulla est justo",
                                      // textAlign: TextAlign.left,
                                      toverflow: TextOverflow.ellipsis,
                                      center: null,
                                      color: const Color(0xff797A7A),
                                      line: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: SizeConfig.safeBlockHorizontal! * 30,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/fruits4.jpg'),
                                  fit: BoxFit.fill,
                                ),
                                // hello this is testing commit
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
