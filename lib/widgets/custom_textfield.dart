// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:aiapait/utils/colors.dart';
import 'package:aiapait/utils/utils.dart';
import 'package:aiapait/widgets/custom_text.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  FocusNode currentNode;
  FocusNode? nextNode;

  final String hintText;
  IconData? preFixIcon;
  IconData? suffixIcon;

  CustomTextField(
      {Key? key,
      required this.controller,
      required this.validator,
      required this.currentNode,
      this.nextNode,
      required this.hintText,
      this.preFixIcon,
      this.suffixIcon,
      this.obscureText = false})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorMessage;
  bool isFormValid = false; // Add this line

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 6,
          child: TextFormField(
            obscureText: widget.obscureText,
            focusNode: widget.currentNode,
            controller: widget.controller,
            onChanged: (value) {
              setState(() {
                errorMessage = widget.validator?.call(value);
                isFormValid = errorMessage == null;
              });
            },
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(
                  context, widget.currentNode, widget.nextNode!);
            },
            decoration: InputDecoration(
              prefixIcon: widget.preFixIcon != null
                  ? Icon(
                      widget.preFixIcon,
                      color: Color(AppColors.primary),
                    )
                  : null,
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                mainAxisSize: MainAxisSize.min,
                children: [
                  errorMessage != null
                      ? Icon(
                          Icons.info_rounded,
                          color: Color(0xFFF44336),
                        )
                      : isFormValid // Update this line
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : SizedBox(),
                  SizedBox(
                    width: 2,
                  ),
                  if (widget.suffixIcon != null)
                    Icon(
                      widget.suffixIcon,
                    ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Color(AppColors.primary),
                  width: 2,
                ),
              ),
              hintText: widget.hintText,
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
        ),
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: CustomText(
              text: errorMessage!,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.red,
            ),
          ),
      ],
    );
  }
}
