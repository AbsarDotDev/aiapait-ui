// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:aiapait/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  IconData? preFixIcon;
  IconData? suffixIcon;
  CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.preFixIcon,
      this.suffixIcon})
      : super(key: key);

  Widget build(BuildContext context) {
    return Card(
      elevation: 20.0,
      shadowColor: Colors.grey[50],
      child: TextFormField(
        autofocus: false,
        decoration: InputDecoration(
            prefixIcon: preFixIcon != null
                ? Icon(
                    preFixIcon,
                    color: Color(AppColors.primary),
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Icon(
                    suffixIcon,
                  )
                : null,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Color(AppColors
                      .primary), // Change the border color when focused
                  width: 3.0,
                )),
            hintText: 'Password',
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(20, 10, 20.0, 10.0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.white, width: 3.0))),
      ),
    );
    // Container(
    //   decoration: const BoxDecoration(
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.grey,
    //         blurRadius: 1,
    //         spreadRadius: 1,
    //       )
    //     ],
    //   ),
    //   child: TextField(
    //     controller: controller,
    //     decoration: InputDecoration(
    //       filled: true,
    //       fillColor: Colors.white,
    //       hintText: hintText,
    //     ),
    //   ),
    // );
  }
}
