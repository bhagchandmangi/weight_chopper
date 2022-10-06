import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/DietInnerTab.dart';
import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/CreateDietCustomPlan.dart';
import 'package:weightchopper_flutter_project/screens/diet_plan_screens/tabs/DietMyPlans.dart';

class DietTabView extends StatefulWidget {
  const DietTabView({Key? key}) : super(key: key);

  @override
  _DietTabViewState createState() => _DietTabViewState();
}

class _DietTabViewState extends State<DietTabView> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int initialIndex;

    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Container(
      child: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: height * 0.25,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Diet.png',
                    fit: BoxFit.cover,
                    height: height * 0.3,
                    width: MediaQuery.of(context).size.width,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Diet Programs",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const DietMyPlansView();
                          }));
                        },
                        child: Text(
                          "My Plans",
                          style: TextStyle(
                              fontSize: MySize.size15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          var route = MaterialPageRoute(
                              builder: (context) =>
                                  const CreateDietCustomPlan());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          "Create custom plan",
                          style: TextStyle(
                              fontSize: MySize.size15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          // Padding(
          //   padding: EdgeInsets.all(15.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //         children: [
          //           Text(""),
          //           DDText(
          //             title: "Active Plan(s)",
          //           ),
          //         ],
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           var route =
          //               MaterialPageRoute(builder: (context) => GroceryList());
          //           Navigator.push(context, route);
          //         },
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.list,
          //               color: primaryColor,
          //             ),
          //             Padding(
          //               padding: EdgeInsets.only(bottom: 1.0),
          //               child: DDText(
          //                 title: "Grocery list",
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                            initialIndex = 1;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const DietInnerTab(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/diet1.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Keto Diet",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "2 weeks",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
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
                            setState(() {
                              initialIndex = 1;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const DietInnerTab()),
                            );
                          },
                          child: Image.asset(
                            'assets/images/diet2.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Keto Diet",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "4 weeks",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
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
      ),
    );
  }
}
