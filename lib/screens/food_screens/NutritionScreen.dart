import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/exercise_screens/WeightDetails.dart';
import 'package:weightchopper_flutter_project/widget/CircleButton.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({Key? key}) : super(key: key);

  @override
  _NutritionScreenState createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  @override
  Map<String, double> dataMap = {
    "Flutter": 36,
    "React": 45,
    "Xamarin": 19,
  };
  List<Color> colorList = [
    const Color(0xff0ABFC8),
    const Color(0xffA954B1),
    const Color(0xffE55864),
  ];

  final ChartType _chartType = ChartType.disc;
  // bool _showCenterText = true;
  final double _ringStrokeWidth = 50;
  final double _chartLegendSpacing = 32;

  // bool _showLegendsInRow = false;
  // bool _showLegends = true;

  final bool _showChartValueBackground = false;
  final bool _showChartValues = true;
  final bool _showChartValuesInPercentage = true;
  final bool _showChartValuesOutside = false;
  var workList = ["Today", "Week", "Month"];
  int counter = 0;

  var dropvalue = "Daily";

  // LegendPosition _legendPosition = LegendPosition.bottom;

  int key = 0;

  Widget foodDetailsSection() {
    return Container(
      margin: EdgeInsets.only(
          left: MySize.size10!, right: MySize.size10!, bottom: MySize.size20!),
      child: Card(
          elevation: 0.5,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child:
                      dataRowView("Highest in Calories", "", titleBold: true),
                ),
                const Divider(),
                dataRowView("Pizza", "600"),
                const Divider(),
                dataRowView("Roti", "290"),
                const Divider(),
                dataRowView("Nuggets", "200"),
                const Divider(
                  height: 10,
                  color: Colors.transparent,
                )
              ],
            ),
          )),
    );
  }

  Container pieChartSection(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(bottom: MySize.size10!),
      margin: EdgeInsets.only(left: MySize.size10!, right: MySize.size10!),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            SizedBox(
              height: MySize.size20!,
            ),
            PieChart(
              key: ValueKey(key),
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: _chartLegendSpacing,
              chartRadius: MediaQuery.of(context).size.width / 3.2 > 300
                  ? 300
                  : MediaQuery.of(context).size.width / 3.2,
              colorList: colorList,
              initialAngleInDegree: 0,
              chartType: _chartType,
              legendOptions: const LegendOptions(
                // showLegendsInRow: _showLegendsInRow,
                // legendPosition: _legendPosition,
                showLegends: false,
                // legendShape: BoxShape.rectangle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: _showChartValueBackground,
                showChartValues: _showChartValues,
                decimalPlaces: 0,
                chartValueStyle: GoogleFonts.openSans(
                  backgroundColor: Colors.transparent,

                  color: Colors.white,
                  // background: Paint()
                ),
                showChartValuesInPercentage: _showChartValuesInPercentage,
                showChartValuesOutside: _showChartValuesOutside,
              ),
              ringStrokeWidth: _ringStrokeWidth,
              emptyColor: Colors.grey,
            ),
            SizedBox(height: MySize.size30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: MySize.size16!),
                      child: Column(
                        children: [
                          CircleButton(
                            color: colorList[1],
                            onTap: () => print("Cool"),
                            iconData: null,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MySize.size10!),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DDText(
                            title: "Carbs",
                            size: MySize.size12,
                          ),
                          DDText(
                            title: "45% (162.1 g)",
                            size: MySize.size12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MySize.size60,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: MySize.size16!),
                      child: Column(
                        children: [
                          CircleButton(
                            color: colorList[2],
                            onTap: () => print("Cool"),
                            iconData: null,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MySize.size10!),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DDText(
                            title: "Fat",
                            size: MySize.size12,
                          ),
                          DDText(
                            title: "19% (121.1 g)",
                            size: MySize.size12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: MySize.size30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: MySize.size16!),
                          child: CircleButton(
                            color: colorList[0],
                            onTap: () => print("Cool"),
                            iconData: null,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MySize.size10!),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DDText(
                            title: "Protein",
                            size: MySize.size12,
                          ),
                          DDText(
                            title: "36% (162.1 g)",
                            size: MySize.size12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MySize.size60,
                ),
                Padding(
                  padding: EdgeInsets.only(right: MySize.size32),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: MySize.size16!),
                            child: CircleButton(
                              color: Colors.blue,
                              onTap: () => print("Cool"),
                              iconData: null,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: MySize.size10!),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DDText(
                              title: "Other",
                              size: MySize.size12,
                            ),
                            DDText(
                              title: "0% (0 g)",
                              size: MySize.size12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MySize.size10!,
            ),
            const Divider(),
            dataRowView("Total Calories", "1,078"),
            const Divider(),
            dataRowView("Net Calories", "1,078"),
            const Divider(),
            dataRowView("Goal", "1,078"),
            const Divider(
              height: 10,
              color: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  Container tabsSection() {
    return Container(
      margin: const EdgeInsets.only(top: 4),

      padding: EdgeInsets.only(
          bottom: MySize.size20!,
          top: MySize.size20!,
          left: MySize.size10!,
          right: MySize.size10!),
      color: Colors.white,
      // color: Colors.red,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WeightDetails()),
              );
            },
            child: Row(
              children: [
                const Icon(
                  MdiIcons.weightLifter,
                  color: primaryColor,
                ),
                DDText(title: 'Weight Details'),
              ],
            ),
          ),
          Expanded(flex: 1, child: Container()),
          Row(
            children: [
              const Icon(
                MdiIcons.listStatus,
                color: primaryColor,
              ),
              DDText(title: 'Other Details'),
            ],
          )
        ],
      ),
    );
  }

  Widget dataRowView(title, calories, {titleBold}) {
    return Container(
      padding: EdgeInsets.only(
        left: MySize.size15!,
        right: MySize.size15!,
        bottom: MySize.size15!,
        top: MySize.size15!,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DDText(
            title: title,
            size: MySize.size12,
            weight: titleBold == true ? FontWeight.bold : FontWeight.normal,
          ),
          DDText(
            title: calories,
            size: MySize.size12,
          )
        ],
      ),
    );
  }

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

  Container headerSection() {
    return Container(
      padding: EdgeInsets.only(bottom: MySize.size20!, top: MySize.size20!),
      color: Colors.white,
      // color: Colors.red,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.only(left: MySize.size26!),
            child: DDText(
                title: workList[counter],
                size: MySize.size15!,
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
                  size: MySize.size15!,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Container(
        color: const Color(0xffF8F8FA),
        child: Column(
          children: [
            headerSection(),
            // Divider(color: Colors.transparent),
            // tabsSection(),
            pieChartSection(context),
            foodDetailsSection()
          ],
        ),
      ),
    );
  }
}
