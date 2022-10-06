import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:weightchopper_flutter_project/Component/DDText.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';

var quotation =
    "As they say it's all in the mind. the better the mind state more likely you succeed";

// ############################ Goal, Food, Exercise, Calories #################################

Widget goalFoodExerciseCaloriesView() {
  return Container(
    // color: Colors.red,
    margin: EdgeInsets.only(
      left: MySize.size20!,
    ),
    padding: EdgeInsets.only(
      left: MySize.size4!,
      right: MySize.size26!,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DDText(
                  title: "Goal",
                  size: 15,
                  weight: FontWeight.w500,
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Countup(
                      begin: 0,
                      end: 1100,
                      duration: const Duration(seconds: 1),
                      separator: ',',
                      style: GoogleFonts.openSans(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),

                    // DDText(
                    //   title: "11,00",
                    //   size: MySize.size15,
                    //   weight:
                    //       FontWeight.w300,
                    // ),
                  ],
                ),
                SizedBox(height: MySize.size10),
                SizedBox(
                  // margin: EdgeInsets.only(left: MySize.size20),
                  width: MySize.size34,
                  child: const StepProgressIndicator(
                    totalSteps: 100,
                    direction: Axis.horizontal,
                    currentStep: 100,
                    padding: 0,
                    selectedColor: primaryColor,
                    unselectedColor: Colors.black12,
                    progressDirection: TextDirection.ltr,
                    //selectedSize: 10.0,
                    // roundedEdges: Radius.elliptical(6, 30),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: MySize.size10!),
                  child: Image.asset("assets/icons/plus.png"),
                ),
                const Text("")
              ],
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: MySize.size20!),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DDText(
                    title: "Food",
                    size: 15,
                  ),
                  Countup(
                    begin: 0,
                    end: 300,
                    duration: const Duration(seconds: 1),
                    separator: ',',
                    style: GoogleFonts.openSans(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: MySize.size10),
                  SizedBox(
                    // margin: EdgeInsets.only(left: MySize.size20),
                    width: MySize.size36,
                    child: const StepProgressIndicator(
                      totalSteps: 100,
                      direction: Axis.horizontal,
                      currentStep: 100,
                      padding: 0,
                      selectedColor: primaryColor,
                      unselectedColor: Colors.black12,
                      progressDirection: TextDirection.ltr,
                      //selectedSize: 10.0,
                      // roundedEdges: Radius.elliptical(6, 30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MySize.size10!,
                      left: MySize.size2!,
                      right: MySize.size8),
                  child: Image.asset("assets/icons/minus.png"),
                ),
                const Text("")
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                DDText(
                  title: "Exercise",
                  size: 15,
                ),
                Countup(
                  begin: 0,
                  end: 200,
                  duration: const Duration(seconds: 1),
                  separator: ',',
                  style: GoogleFonts.openSans(
                      fontSize: 15, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: MySize.size10),
                SizedBox(
                  width: MySize.size56,
                  child: const StepProgressIndicator(
                    totalSteps: 100,
                    direction: Axis.horizontal,
                    currentStep: 20,
                    padding: 0,
                    selectedColor: primaryColor,
                    unselectedColor: Colors.black12,
                    progressDirection: TextDirection.ltr,
                    //selectedSize: 10.0,
                    // roundedEdges: Radius.elliptical(6, 30),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MySize.size10!,
                      left: MySize.size10!,
                      right: MySize.size6),
                  child: DDText(
                    title: "=",
                    size: MySize.size18,
                  ),
                ),
                const Text("")
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                DDText(
                  title: "Calories Left",
                  size: MySize.size16,
                ),
                Countup(
                  begin: 0,
                  end: 1000,
                  duration: const Duration(seconds: 1),
                  separator: ',',
                  style: GoogleFonts.openSans(
                      fontSize: 15, fontWeight: FontWeight.w300),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MySize.size10,
                    ),
                    SizedBox(
                      width: MySize.size80,
                      child: const StepProgressIndicator(
                        totalSteps: 100,
                        direction: Axis.horizontal,
                        currentStep: 50,
                        padding: 0,
                        selectedColor: primaryColor,
                        unselectedColor: Colors.black12,
                        progressDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

// ############################ Left Side Items #################################

Widget foodItemLeft(imagePath, title, weight, calories) {
  return Container(
    padding: EdgeInsets.only(left: MySize.size16!),
    child: Row(
      children: [
        Row(
          children: [
            Image.asset(imagePath),
            SizedBox(
              width: MySize.size10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DDText(
                  title: title,
                  size: MySize.size14,
                ),
                DDText(
                  title: weight,
                  size: MySize.size12,
                  color: const Color(0xffafafaf),
                ),
                DDText(
                  title: calories,
                  size: MySize.size16,
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}

// ############################ Right Side Items #################################

Widget foodItemRight(imagePath, title, weight, calories) {
  return Container(
    // padding: EdgeInsets.only(left: MySize.size18),
    child: Row(
      children: [
        Row(
          children: [
            // SizedBox(
            //   width: MySize.size10,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DDText(
                  title: title,
                  size: MySize.size16,
                ),
                DDText(
                  title: weight,
                  size: MySize.size12,
                  color: const Color(0xffafafaf),
                ),
                DDText(
                  title: calories,
                  size: MySize.size16,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: MySize.size4!),
              child: Image.asset(imagePath),
            ),
          ],
        ),
      ],
    ),
  );
}

// ############################ QUOTATION SECTION #################################

Widget quotationSection() {
  return Container(
    padding: EdgeInsets.only(left: MySize.size36!, right: MySize.size32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(
        //   height: SizeConfig.safeBlockVertical * 2,
        // ),
        Container(
          child: Row(
            children: <Widget>[
              Flexible(
                child: Text(
                  '"$quotation"',
                  style: GoogleFonts.montserrat(
                      fontStyle: FontStyle.italic, letterSpacing: 0.4),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
