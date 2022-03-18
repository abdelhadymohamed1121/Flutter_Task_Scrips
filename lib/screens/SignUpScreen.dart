// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../cache_Helper/Cache_helper.dart';
import '../utils/Constatnt.dart';
import 'SendEmailForVerifactionCodeScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();

  var userNameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var password2Controller = TextEditingController();

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
                    height: 20,
                  ),
                  defaultFormField(
                    key: Key("userNameSignUp"),
                    controller: userNameController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'please enter your userName';
                      }
                    },
                    prefix: Icons.perm_identity,
                    type: TextInputType.emailAddress,
                    label: 'userName',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    key: Key("emailSignUp"),
                    controller: emailController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'please enter your email address';
                      }
                      else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                        return 'please enter correct email';
                      }
                    },
                    prefix: Icons.email_outlined,
                    type: TextInputType.emailAddress,
                    label: 'Email address',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    key: Key("passwordSignUp"),
                    controller: passwordController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'please enter your password';
                      }else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
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
                    prefix: Icons.vpn_key_outlined,
                    type: TextInputType.visiblePassword,
                    label: 'password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    key: Key("confirmPasswordSignUp"),
                    controller: password2Controller,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'please enter your password';
                      }else if(!RegExp(r'').hasMatch(value)){
                        return 'please enter valid password';
                      }else if(passwordController.text != password2Controller.text){
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
                    prefix: Icons.vpn_key_outlined,
                    type: TextInputType.visiblePassword,
                    label: 'confirm Password',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MaterialButton(
                    key: Key("singUpButton"),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 55.0),
                    textColor: Colors.white,
                    color: const Color(0xff05445E),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        var user = {
                          "userName": userNameController.text,
                          "email": emailController.text,
                          "password": passwordController.text,
                          "verificationCode": "19521",
                        };
                        String userString = jsonEncode(user);
                        //print(user);
                        //print(userString);
                        CacheHelper.saveData(
                          key: 'userData',
                          value: userString,
                        ).then((value) {
                          print(value.toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SendEmailScreen(),
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
                          "Sign Up",
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
