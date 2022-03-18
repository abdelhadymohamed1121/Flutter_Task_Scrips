// ignore_for_file: file_names, use_key_in_widget_constructors, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../cache_Helper/Cache_helper.dart';
import '../utils/Constatnt.dart';
import 'ForgetScreen.dart';
import 'HomeScreen.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  bool isPassword = true;

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
                    controller: emailController,
                    validate: (value) {
                      String userData = CacheHelper.getData(key: 'userData');
                      var email = jsonDecode(userData)['email'].toString();
                      print(email);
                      if (value.isEmpty) {
                        return 'please enter your email';
                      } else if (email != emailController.text) {
                        return 'please enter correct email';
                      }
                    },
                    prefix: Icons.perm_identity_outlined,
                    type: TextInputType.emailAddress,
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    validate: (value) {
                      String userData = CacheHelper.getData(key: 'userData');
                      var password =
                          jsonDecode(userData)['password'].toString();
                      print(password);
                      if (value.isEmpty) {
                        return 'please enter your password';
                      } else if (password != passwordController.text) {
                        return 'please enter the correct password';
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
                    height: 40,
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 55.0),
                    textColor: Colors.white,
                    color: const Color(0xff05445E),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
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
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                color: Color(0xff189AB4),
                              ),
                            ),
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forget Password',
                          style: TextStyle(
                            color: Color(0xff189AB4),
                          ),
                        ),
                      ),
                    ],
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
