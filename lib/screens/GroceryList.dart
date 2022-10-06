import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/widget/AppBarView.dart';
import 'package:weightchopper_flutter_project/widget/CustomBottomNavigationBar.dart';
import 'package:weightchopper_flutter_project/widget/CustomDrawer.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({Key? key}) : super(key: key);

  @override
  _GroceryListState createState() => _GroceryListState();
}

bool pressed = false;
int val = -1;
List expansionTileData = [
  {
    "title": "This Week",
    "description": "Apples 2kg",
    "subDescription": "you will be eating 2 apples this week",
    "selected": false,
  },
  {
    "title": "Next Week",
    "description": "Cabbage 2kg",
    "subDescription": "you will be eating 3 cabbage this week",
    "selected": false,
  },
  {
    "title": "Week Three",
    "description": "Potatoes 2kg",
    "subDescription": "you will be eating 4 potatoes this week",
    "selected": false,
  },
  {
    "title": "Week Four",
    "description": "Tomatoes 2kg",
    "subDescription": "you will be eating 5 tomatoes this week",
    "selected": false,
  },
];

class _GroceryListState extends State<GroceryList>
    with TickerProviderStateMixin {
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
    MySize().init(context);

    // ignore: unused_local_variable
    int selectedIndex;
    bool selectedBox = false;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const CustomDrawer(),
        bottomNavigationBar: const CustomStaticBottomNavigationBar(),
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   leading: Builder(
        //     builder: (context) {
        //       return GestureDetector(
        //         onTap: () {
        //           Scaffold.of(context).openDrawer();
        //         },
        //         child: Container(
        //           child: Image.asset(
        //             "assets/icons/menuu.png",
        //             color: Color(0xff797A7A),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        //   // bottom: TabBar(
        //   //   indicatorColor: Color(0xff4885ED),
        //   //   labelColor: Color(0xff4885ED),
        //   //   indicatorSize: TabBarIndicatorSize.label,
        //   //   unselectedLabelColor: Colors.black87,
        //   //   labelStyle: TextStyle(
        //   //     fontSize: 14,
        //   //     color: Colors.black54,
        //   //     fontFamily: "Open Sans",
        //   //     fontWeight: FontWeight.w400,
        //   //   ),
        //   //   tabs: [
        //   //     Tab(
        //   //       text: 'Apple',
        //   //     ),
        //   //     Tab(text: 'Summary'),
        //   //     Tab(text: 'Blogs'),
        //   //     Tab(text: 'Goals'),
        //   //   ],
        //   // ),
        //   iconTheme: IconThemeData(color: Colors.grey),
        //   elevation: 1,
        //   backgroundColor: Colors.white,
        //   actions: [
        //     // IconButton(
        //     //     icon: Icon(
        //     //       Icons.search,
        //     //       color: Colors.black45,
        //     //     ),
        //     //     onPressed: () {
        //     //       setState(() {
        //     //         _selectedIndex = 6;
        //     //         currentScreen = SearchFood();
        //     //       });
        //     //     }),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: IconButton(
        //         icon: Image.asset(
        //           "assets/icons/bell2.png",
        //           color: Color(0xff797A7A),
        //         ),
        //         onPressed: () {
        //           Navigator.push(context, MaterialPageRoute(builder: (context) {
        //             return NotificationScreen();
        //           }));
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        appBar: customAppBar(
          context,
          elevation: 0.5,
          // tabBar: TabBar(
          //   onTap: (index) {
          //     setState(() {
          //       _tabController.index = 3;
          //     });
          //   },
          //   controller: _tabController,
          //   labelPadding: EdgeInsets.only(left: MySize.size4),
          //   indicatorColor: Colors.transparent,
          //   labelColor: Colors.black,
          //   indicatorSize: TabBarIndicatorSize.label,
          //   unselectedLabelColor: Colors.black87,
          //   tabs: myTabs,
          // ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: MySize.size10!),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DDText(
                          title: "Today - 7 Oct",
                          center: false,
                          size: MySize.size11,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MySize.size16!),
                          child: DDText(
                            title: "4 days remaining",
                            size: MySize.size11,
                            center: false,
                            weight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: MySize.size10!),
                    child: Column(
                      children: [
                        DDText(title: "9"),
                        DDText(
                          title: "items pending",
                          size: MySize.size11,
                          weight: FontWeight.w300,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: expansionTileData.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            title: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                            // right: MySize.size10,
                                            bottom: MySize.size5!,
                                          ),
                                          child: DDText(
                                            title: expansionTileData[i]
                                                ["title"],
                                            size: MySize.size15,
                                            weight: FontWeight.w600,
                                          ),
                                        ),
                                      ]),
                                ),
                                // SizedBox(
                                //   width: MySize.size20,
                                // ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MySize.size90,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xffe6e6e6)),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Container(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              DDText(
                                                title: "05, Oct – ",
                                                size: 10,
                                              ),
                                              DDText(
                                                  size: 10, title: "12, Oct"),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            children: <Widget>[
                              Column(children: [
                                for (int index = 0;
                                    index < expansionTileData.length;
                                    index++)
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey[300]!,
                                                width: 0.5))),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 6.0),
                                                child: Radio(
                                                  toggleable: true,
                                                  value: index,
                                                  groupValue: val,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      val = value!;
                                                      expansionTileData[index]
                                                              ["selected"] =
                                                          !expansionTileData[
                                                                  index]
                                                              ["selected"];
                                                    });
                                                    print(index);
                                                  },
                                                  activeColor: Colors.green,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: ListTile(
                                                dense: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        top: 14),
                                                horizontalTitleGap: 2.0,
                                                // leading: Padding(
                                                //   padding: EdgeInsets.only(
                                                //       bottom: 16.0),
                                                //   child: Radio(
                                                //     toggleable: true,
                                                //     value: index,
                                                //     groupValue: val,
                                                //     onChanged: (int value) {
                                                //       setState(() {
                                                //         val = value;
                                                //       });
                                                //       print(index);
                                                //     },
                                                //     activeColor: Colors.green,
                                                //   ),
                                                // ),
                                                // trailing: Icon(
                                                //   Icons.check,
                                                //   color: expansionTileData[index]
                                                //           ["selected"]
                                                //       ? Colors.green
                                                //       : Colors.grey,
                                                // ),
                                                title: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      expansionTileData[index]
                                                              ["selected"] =
                                                          !expansionTileData[
                                                                  index]
                                                              ["selected"];
                                                    });
                                                  },
                                                  child: Text(
                                                    expansionTileData[index]
                                                        ["description"],
                                                    style: GoogleFonts.openSans(
                                                      decoration:
                                                          expansionTileData[
                                                                      index]
                                                                  ["selected"]
                                                              ? TextDecoration
                                                                  .lineThrough
                                                              : TextDecoration
                                                                  .none,
                                                      fontSize: MySize.size11,
                                                    ),
                                                  ),
                                                ),
                                                subtitle: DDText(
                                                  title:
                                                      expansionTileData[index]
                                                          ["subDescription"],
                                                  size: MySize.size10,
                                                  color: Colors.grey,
                                                  cut: selectedBox,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    expansionTileData[index]
                                                            ["selected"] =
                                                        !expansionTileData[
                                                            index]["selected"];
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(child: Container()),
                                            Expanded(
                                              child: Icon(
                                                Icons.check,
                                                color: expansionTileData[index]
                                                        ["selected"]
                                                    ? Colors.green
                                                    : Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),

                                        // expansionTileData[index] ==
                                        //         expansionTileData.last
                                        //     ? Divider(
                                        //         height: 0,
                                        //         thickness: 0.5,
                                        //         color: Colors.transparent,
                                        //       )
                                        //     : Divider(
                                        //         height: 0,
                                        //         thickness: 0.5,
                                        //         color: Colors.grey[300],
                                        //       )
                                      ],
                                    ),
                                  ),
                              ]),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
