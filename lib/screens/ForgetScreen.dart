// ignore_for_file: file_names, use_key_in_widget_constructors, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../cache_Helper/Cache_helper.dart';
import '../utils/Constatnt.dart';
import 'LoginScreen.dart';

class ForgetScreen extends StatefulWidget {
  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  var formKey = GlobalKey<FormState>();

  var newPasswordController = TextEditingController();

  var reNewPasswordController = TextEditingController();
  bool isPassword = true;
  bool isPassword2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe4f6f6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 110,
                  ),
                  defaultFormField(
                    controller: newPasswordController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'please enter your password';
                      } else if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                        return 'please enter valid password';
                      }
                    },
                    suffix: isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    onSubmit: (value) {},
                    isPassword: isPassword,
                    suffixPressed: () {
                      setState(() {
                        if(isPassword){
                          isPassword = false;
                        }else{
                          isPassword = true;
                        }
                        print(isPassword);
                      });
                    },
                    prefix: Icons.alternate_email_outlined,
                    type: TextInputType.emailAddress,
                    label: 'new Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    controller: reNewPasswordController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'please enter your password';
                      } else if (!RegExp(r'').hasMatch(value)) {
                        return 'please enter valid password';
                      } else if (newPasswordController.text !=
                          reNewPasswordController.text) {
                        return 'please enter the same password';
                      }
                    },
                    suffix: isPassword2 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    onSubmit: (value) {},
                    isPassword: isPassword2,
                    suffixPressed: () {
                      setState(() {
                        if(isPassword2){
                          isPassword2 = false;
                        }else{
                          isPassword2 = true;
                        }
                        print(isPassword2);
                      });
                    },
                    prefix: Icons.alternate_email_outlined,
                    type: TextInputType.emailAddress,
                    label: 'Confirm Password',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 55.0),
                    textColor: Colors.white,
                    color: const Color(0xff05445E),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        String userData = CacheHelper.getData(key: 'userData');
                        var user = jsonDecode(userData);
                        user['password'] = newPasswordController.text;
                        String userString = jsonEncode(user);
                        CacheHelper.saveData(
                          key: 'userData',
                          value: userString,
                        ).then((value) {
                          print(value.toString());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        });
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        color: Color(0xff05445E),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Send",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
