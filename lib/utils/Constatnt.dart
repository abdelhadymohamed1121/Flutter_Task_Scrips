// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget defaultFormField({
  var key,
  @required TextEditingController controller,
  @required TextInputType type,
  var onSubmit,
  var onChange,
  var onTap,
  bool isPassword = false,
  @required String Function(dynamic value) validate,
  @required String label,
  @required IconData prefix,
  var suffix,
  var suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      key: key,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: const OutlineInputBorder(),
      ),
    );


Widget myDivider() => const Padding(
  padding: EdgeInsetsDirectional.only(
    start: 80,
    top: 5,
    bottom: 5,
  ),
  child: SizedBox(
    width: double.infinity,
    height: 3.0,
  ),
);