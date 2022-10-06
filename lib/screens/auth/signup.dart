import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uiblock/uiblock.dart';
import 'package:weightchopper_flutter_project/constants/constant.dart';
import 'package:weightchopper_flutter_project/utils/validation.dart';
import 'package:weightchopper_flutter_project/widget/custom_form_fields.dart';
import 'package:http/http.dart' as http;
import '../../theme/TextStyles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen();

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final form = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _pwd = "";
  String _pwd2 = "";
  // ignore: missing_return
  // ignore: override_on_non_overriding_member
  // ignore: missing_return
  Future<dynamic> signUpUser() async {
    print("Called _loginUser=======================");
    UIBlock.block(context);
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Cookie':
            '.AspNetCore.Session=CfDJ8LkC0h8Zqs5NkmTcgtyrhNkYwmRVcMK0aIUoEPn6D7IVN31IVTf7hsFfclATOj4Tmw3HVSp9PhZEGTQbVRrg1lIK%2BEqpQLkS1z0Vx6UHbwGSbu1WIpDE%2Bc3bj9Y%2BIIdmRQOOCf0OtUoqnvDebgF9UL0ulR2OsK%2BkybIsVzuab99l'
      };
      var request = http.Request(
          'POST', Uri.parse('https://weightchoper.somee.com/api/user'));
      request.body = json.encode({
        "Email": _email,
        "Password": _pwd,
        "Name": _name,
        "UserName": _email.split("@")[0],
        "Gender": "male"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var resp = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        print("Status is 200");
        print(await response.stream.bytesToString());
      } else {
        print("${response.statusCode}");
        print(response.reasonPhrase);
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
                  'Sign Up',
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
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomFormFields.formFieldWithoutIcon(
                            hint: 'Name',
                            icon: const Icon(
                              Icons.account_circle_outlined,
                              color: primaryColor,
                              size: 30,
                            ),
                            validator: (value) {
                              print(value);
                              return Validation.validateValue(
                                  value!, 'Name', true);
                            },
                            onChange: (val) {
                              _name = val!;
                              return null;
                            },
                            onSaved: (val) {
                              _name = val!;
                              return null;
                            },
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomFormFields.formFieldWithoutIcon(
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
                              _email = val!;
                              return null;
                            },
                            onSaved: (val) {
                              _email = val!;
                              return null;
                            },
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomFormFields.formFieldWithoutIcon(
                            hint: 'Password',
                            icon: const Icon(
                              Icons.lock_open_rounded,
                              color: primaryColor,
                              size: 30,
                            ),
                            validator: (value) {
                              print(value);
                              return Validation.validateValue(
                                  value!, 'Password', true);
                            },
                            onChange: (val) {
                              _pwd = val!;
                              return null;
                            },
                            onSaved: (val) {
                              _pwd = val!;
                              return null;
                            },
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomFormFields.formFieldWithoutIcon(
                            hint: 'Confirm Password',
                            icon: const Icon(
                              Icons.lock_outline,
                              color: primaryColor,
                              size: 30,
                            ),
                            validator: (value) {
                              print(value);
                              return Validation.validateValue(
                                  value!, 'Confirm password', true);
                            },
                            onChange: (val) {
                              _pwd2 = val!;
                              return null;
                            },
                            onSaved: (val) {
                              _pwd2 = val!;
                              return null;
                            },
                            keyboardType: TextInputType.name,
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
                              Text(
                                'Signin instead',
                                style: darkText12Px,
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_pwd == _pwd2) {
                                    signUpUser();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Password doesn't match")));
                                  }
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
                                      'Sign Up',
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
