import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uiblock/uiblock.dart';
import 'package:weightchopper_flutter_project/Model/UserDataModel.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/screens/auth/forgot_password_screen.dart';
import 'package:weightchopper_flutter_project/screens/auth/signup.dart';
import 'package:weightchopper_flutter_project/screens/card_details/card_details_screen.dart';
import 'package:weightchopper_flutter_project/utils/validation.dart';
import 'package:weightchopper_flutter_project/widget/custom_form_fields.dart';

import '../../theme/TextStyles.dart';
import '../Bottom_Navigation/bottom_bar.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

bool isObscure = true;

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _emailController.text = "Shabby123";
    _passwordController.text = "12354555";
    super.initState();
  }

  final form = GlobalKey<FormState>();

  Map<String, dynamic>? userdata;
  // ignore: unused_field
  UserDataModel? _userDataModel;
  // ignore: unused_element
  Future<dynamic> _loginUser() async {
    print("Called _loginUser=======================");
    UIBlock.block(context);
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Cookie':
            '.AspNetCore.Session=CfDJ8LkC0h8Zqs5NkmTcgtyrhNkYwmRVcMK0aIUoEPn6D7IVN31IVTf7hsFfclATOj4Tmw3HVSp9PhZEGTQbVRrg1lIK%2BEqpQLkS1z0Vx6UHbwGSbu1WIpDE%2Bc3bj9Y%2BIIdmRQOOCf0OtUoqnvDebgF9UL0ulR2OsK%2BkybIsVzuab99l'
      };
      var request = http.Request(
          'POST', Uri.parse('https://weightchoper.somee.com/api/login'));
      request.body = json.encode({
        "Name": _emailController.text,
        "Password": _passwordController.text
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var resp = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        UIBlock.unblock(context);

        print(resp.runtimeType);
        userdata = json.decode(resp);
        _userDataModel = UserDataModel.fromJson(userdata!);
        print(userdata.runtimeType);
        return true;
      } else {
        print(response.reasonPhrase);
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign In',
                  style: lightText18Px.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: form,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormFields.formFieldWithoutIcon(
                          controller: _emailController,
                          hint: 'Email',
                          icon: const Icon(
                            Icons.email_outlined,
                            color: primaryColor,
                            size: 30,
                          ),
                          validator: (value) {
                            print(value);
                            return Validation.validateValue(
                                value!, 'Email', true);
                          },
                          onChange: (val) {
                            return null;

                            // _email = val;
                          },
                          onSaved: (val) {
                            return null;

                            // _email = val;
                          },
                          keyboardType: TextInputType.name,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen()),
                            );
                          },
                          child: Text(
                            'Forgot username?',
                            style: blueText12Px,
                          ),
                        ),
                        CustomFormFields.formFieldWithoutIcon(
                          suffixIcon: isObscure
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                  child: const Icon(FontAwesomeIcons.eyeSlash))
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                  child: const Icon(FontAwesomeIcons.eye)),
                          isObscure: isObscure,
                          controller: _passwordController,
                          hint: 'Password',
                          icon: const Icon(
                            Icons.lock_open_rounded,
                            color: Colors.blue,
                            size: 30,
                          ),
                          validator: (value) {
                            print(value);
                            return Validation.validateValue(
                                value!, 'Password', true);
                          },
                          onChange: (val) {
                            return null;

                            // _password = val;
                          },
                          onSaved: (val) {
                            return null;

                            // _password = val;
                          },
                          keyboardType: TextInputType.name,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const ForgotPasswordScreen();
                            }));
                          },
                          child: Text(
                            'Forgot password?',
                            style: blueText12Px,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()),
                                  );
                                },
                                child: Text(
                                  'Create Account',
                                  style: darkText12Px,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomBar()),
                                  );
                                  // _loginUser().then((value) {
                                  //   if (value) {
                                  //     Provider.of<UserDataProvider>(context,
                                  //             listen: false)
                                  //         .setUserData(_userDataModel);

                                  //     Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => BottomBar()),
                                  //     );
                                  //     Flushbar(
                                  //       title: 'Message',
                                  //       message: 'Login Successfully!',
                                  //       duration: Duration(seconds: 3),
                                  //       backgroundColor: Colors.green,
                                  //     )..show(context);
                                  //   } else {
                                  //     ScaffoldMessenger.of(context)
                                  //         .showSnackBar(SnackBar(
                                  //             content: Text(
                                  //                 "Email or Password Incorrect")));
                                  //   }
                                  // }).onError((error, stackTrace) {
                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                  //       SnackBar(content: Text("Error 404")));
                                  // });
                                },
                                child: Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                  child: const Center(
                                    child: Text(
                                      'Log In',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CardDetailScreen()),
                                  );
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                          0,
                                          4,
                                        ), // changes position of shadow
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    // borderRadius:
                                    //     BorderRadius.all(Radius.circular(40))
                                  ),
                                  //margin: EdgeInsets.only(right: 8, top: 8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      'assets/images/facebook.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CardDetailScreen()),
                                  );
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                          0,
                                          4,
                                        ), // changes position of shadow
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    // borderRadius:
                                    //     BorderRadius.all(Radius.circular(40))
                                  ),
                                  //margin: EdgeInsets.only(right: 8, top: 8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      'assets/images/google.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CardDetailScreen()),
                                  );
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                          0,
                                          4,
                                        ), // changes position of shadow
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    // borderRadius:
                                    //     BorderRadius.all(Radius.circular(40))
                                  ),
                                  //margin: EdgeInsets.only(right: 8, top: 8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      'assets/images/apple.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
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
}
