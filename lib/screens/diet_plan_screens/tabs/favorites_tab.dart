import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/theme/TextStyles.dart';
import 'package:weightchopper_flutter_project/widget/diet_widget.dart';

class FavoritesTab extends StatefulWidget {
  FavoritesTab();

  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  int selectedQuantity = 1;
  List a = [
    'assets/images/diet2.jpg',
    'assets/images/diet4.jpg',
    'assets/images/diet3.jpg',
    'assets/images/diet3.jpg',
    'assets/images/diet2.jpg',
    'assets/images/diet4.jpg',
    'assets/images/diet3.jpg',
    'assets/images/diet2.jpg',
    'assets/images/diet4.jpg',
    'assets/images/diet3.jpg',
    'assets/images/diet2.jpg',
    'assets/images/diet4.jpg',
  ];
  String tabBarText = 'My Diet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height * .2,
                    child: Image.asset(
                      'assets/images/diet4.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 30,
                      left: 20,
                      child: Text(
                        'Keto Diet',
                        style:
                            whiteText18Px.copyWith(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 8, bottom: 8, top: 8),
                child: Text(
                  'Day',
                  style: darkText16Px,
                ),
              ),
              Container(
                height: 50,
                width: Get.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedQuantity = 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            color: selectedQuantity == 1
                                ? primaryColor
                                : Colors.grey[300],
                          ),
                          width: 30,
                          height: 40,
                          child: Center(
                              child: Column(
                            children: [
                              Text('Day'),
                              Text('1'),
                            ],
                          )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedQuantity = 2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          color: selectedQuantity == 2
                              ? primaryColor
                              : Colors.grey[300],
                        ),
                        width: 30,
                        height: 40,
                        child: Center(
                            child: Column(
                          children: [
                            Text('Day'),
                            Text('2'),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedQuantity = 3;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          color: selectedQuantity == 3
                              ? primaryColor
                              : Colors.grey[300],
                        ),
                        width: 30,
                        height: 40,
                        child: Center(
                            child: Column(
                          children: [
                            Text('Day'),
                            Text('3'),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedQuantity = 4;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          color: selectedQuantity == 4
                              ? primaryColor
                              : Colors.grey[300],
                        ),
                        width: 30,
                        height: 40,
                        child: Center(
                            child: Column(
                          children: [
                            Text('Day'),
                            Text('4'),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedQuantity = 5;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          color: selectedQuantity == 5
                              ? primaryColor
                              : Colors.grey[300],
                        ),
                        width: 30,
                        height: 40,
                        child: Center(
                            child: Column(
                          children: [
                            Text('Day'),
                            Text('5'),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedQuantity = 6;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          color: selectedQuantity == 6
                              ? primaryColor
                              : Colors.grey[300],
                        ),
                        width: 30,
                        height: 40,
                        child: Center(
                            child: Column(
                          children: [
                            Text('Day'),
                            Text('6'),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedQuantity = 7;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          color: selectedQuantity == 7
                              ? primaryColor
                              : Colors.grey[300],
                        ),
                        width: 30,
                        height: 40,
                        child: Center(
                            child: Column(
                          children: [
                            Text('Day'),
                            Text('7'),
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '',
                      style: darkText14Px,
                    ),
                    Text(
                      '8:30',
                      style: darkText14Px,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: Container(
                  height: Get.height * .2,
                  //width: Get.width * .8,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return DietWidget();
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lunch',
                      style: darkText14Px,
                    ),
                    Text(
                      '12:30',
                      style: darkText14Px,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: Container(
                  height: Get.height * .2,
                  //width: Get.width * .8,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return DietWidget();
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dinner',
                      style: darkText14Px,
                    ),
                    Text(
                      '9:30',
                      style: darkText14Px,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: Container(
                  height: Get.height * .2,
                  //width: Get.width * .8,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return DietWidget();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
