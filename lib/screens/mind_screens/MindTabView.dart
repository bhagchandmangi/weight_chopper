import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/Controller/ArticlesData.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/screens/articles_screens/ArticleDetails.dart';
import 'package:weightchopper_flutter_project/screens/mind_screens/CognitiveTherapy.dart';
import 'package:weightchopper_flutter_project/screens/mind_screens/MeditationView.dart';
import 'package:weightchopper_flutter_project/screens/mind_screens/PlansScreen.dart';

class MindTabView extends StatefulWidget {
  const MindTabView({Key? key}) : super(key: key);

  @override
  _MindTabViewState createState() => _MindTabViewState();
}

class _MindTabViewState extends State<MindTabView> {
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Container(
      child: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          SizedBox(
//                         decoration:
// BoxDecoration(
//   color: const Color(0xff7c94b6),
//   image:  DecorationImage(
//     fit: BoxFit.cover,
//     colorFilter:
//       ColorFilter.mode(Colors.black.withOpacity(0.2),
//       BlendMode.dstATop),
//     image: AssetImage(
// 'assets/images/meditate_with_susan.png',
//     ),
//   ),
// ),
            width: MediaQuery.of(context).size.width,
            height: height * 0.26,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.darken),
                    child: Image.asset(
                      'assets/images/meditate_with_susan.png',
                      fit: BoxFit.cover,
                      height: height * 0.3,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: MySize.size14!,
                          horizontal: MySize.size20!,
                        ),
                        backgroundColor: const Color(0xff4885ED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.play,
                      size: MySize.size14!,
                    ),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: DDText(
                          title: "Play",
                          size: MySize.size15,
                          color: Colors.white,
                          weight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: MySize.size2!, left: MySize.size8),
                child:
                    DDText(title: "Meditate With Susan", size: MySize.size15),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: MySize.size2!, right: MySize.size8),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/youtube_icon.png",
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: DDText(
                          title: "Expert Guidance  ",
                          size: MySize.size11,
                          weight: FontWeight.w300),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: DDText(
                          title: "•",
                          weight: FontWeight.bold,
                          size: MySize.size11),
                    ),
                    DDText(
                      title: "11 min",
                      size: MySize.size11,
                      weight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MySize.size10!,
          ),
          Padding(
            padding: EdgeInsets.only(left: MySize.size8, right: MySize.size8),
            child: const Divider(),
          ),
          SizedBox(
            height: MySize.size10!,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: MySize.size14!),
              child: DDText(
                title: "Featured CBT",
                size: MySize.size11,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CognitiveTherapy();
                }));
              },
              child: Padding(
                padding: EdgeInsets.only(right: MySize.size14!),
                child: DDText(
                    title: "Browse",
                    size: MySize.size11,
                    weight: FontWeight.w300,
                    color: const Color(0xff4885ED)),
              ),
            ),
          ]),
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const MeditationViewMind();
                            }));
                          },
                          child: Image.asset(
                            'assets/images/susan_1.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Basic",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "3-10 min",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: MySize.size2!),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
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
                            setState(() {});
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //         RunningTabInnerPage(),
                            //   ),
                            // );
                          },
                          child: Image.asset(
                            'assets/images/susan_2.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Breath",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "3-10 min",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: MySize.size2!),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
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
                            setState(() {});
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //         RunningTabInnerPage(),
                            //   ),
                            // );
                          },
                          child: Image.asset(
                            'assets/images/susan_3.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Stress Relief",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "3-10 min",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: MySize.size2!),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.blue,
                                    ),
                                  )
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
          SizedBox(
            height: MySize.size20!,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            // height: height * 0.26,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      left: MySize.size10!, right: MySize.size10!),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/susan_4.png',
                      fit: BoxFit.fill,
                      // height: height * 0.3,
                      // width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      var route = MaterialPageRoute(
                          builder: (context) => const MeditationViewMind());
                      Navigator.push(context, route);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MySize.size14!, left: MySize.size20!),
                              child: DDText(
                                title: "Your Meditation",
                                color: Colors.white,
                                weight: FontWeight.w500,
                                size: MySize.size15,
                              ),
                            ),
                            SizedBox(height: MySize.size10!),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: MySize.size20!),
                                child: DDText(
                                  title:
                                      "As they say it's all in the mind. the better",
                                  color: Colors.white,
                                  weight: FontWeight.w500,
                                  size: MySize.size12,
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: MySize.size20!),
                                child: DDText(
                                  title:
                                      "the mind state more likely you succeed",
                                  color: Colors.white,
                                  weight: FontWeight.w500,
                                  size: MySize.size12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              right: MySize.size22!, top: MySize.size20!),
                          child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(
                                      MySize.size6,
                                    ),
                                    backgroundColor: const Color(0xff4885ED),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side:
                                          const BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const MeditationMyPlansScreen();
                                    }));
                                  },
                                  child: const Text("Discover More"),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MySize.size30!,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MySize.size14!, bottom: MySize.size10!),
                    child: DDText(
                      title: "For You",
                      size: MySize.size15,
                    ),
                  ),
                ],
              ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: articlesData.length,
              //   itemBuilder: (context, i) {
              //     return InkWell(
              //       onTap: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (context) {
              //           return ArticleDetails(
              //             heading: articlesData[i]["heading"],
              //             details: articlesData[i]["details"],
              //             imageUrl: articlesData[i]["imageUrl"],
              //           );
              //         }));
              //       },
              //       child: Card(
              //         margin: EdgeInsets.only(
              //             left: MySize.size10!,
              //             top: MySize.size5!,
              //             bottom: MySize.size5!),
              //         elevation: 1,
              //         child: Row(
              //           // mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Expanded(
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   boxShadow: [
              //                     BoxShadow(
              //                         color: Colors.grey[100],
              //                         spreadRadius: 1,
              //                         blurRadius: 0.2)
              //                   ],
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Expanded(
              //                         child: Padding(
              //                       padding: EdgeInsets.only(
              //                           top: MySize.size8,
              //                           bottom: MySize.size8,
              //                           left: MySize.size8,
              //                           right: MySize.size28),
              //                       child: Column(
              //                         children: [
              //                           Padding(
              //                             padding: EdgeInsets.only(
              //                                 left: MySize.size8),
              //                             child: DDText(
              //                               line: 3,
              //                               title: articlesData[i]["heading"],
              //                               weight: FontWeight.w500,
              //                               center: null,
              //                               size: 15,
              //                             ),
              //                           ),
              //                           Container(
              //                             padding: EdgeInsets.only(
              //                                 left: MySize.size10!,
              //                                 top: MySize.size10!,
              //                                 bottom: MySize.size10!,
              //                                 right: MySize.size10!),
              //                             child: DDText(
              //                               size: 10,
              //                               title:
              //                                   "In at laculis lorem. Parsent tempor dictum tellus ut mlestile. Sed Sed ullamcorper lorem, id faucibus odiio. Duis eu nisi ut ligula cursus molestile at at dolor. Nulla est justo",
              //                               // textAlign: TextAlign.left,
              //                               toverflow: TextOverflow.ellipsis,
              //                               center: null,
              //                               color: Color(0xff797A7A),
              //                               line: 2,
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     )),
              //                     Container(
              //                       height: 100,
              //                       width:
              //                           MediaQuery.of(context).size.width / 3,
              //                       decoration: BoxDecoration(
              //                           image: DecorationImage(
              //                               image: AssetImage(
              //                                 articlesData[i]["imageUrl"],
              //                               ),
              //                               fit: BoxFit.cover)),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),

              blogSection(),
            ],
          )
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
                                height: MySize.size100,
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
}
