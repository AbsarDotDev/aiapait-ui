// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aiapait/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:aiapait/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  final String hintText;
  IconData? preFixIcon;
  IconData? suffixIcon;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.preFixIcon,
    this.suffixIcon,
    required this.validator,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorMessage;

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
          elevation: 20.0,
          shadowColor: Colors.grey[50],
          child: TextFormField(
            controller: widget.controller,
            onChanged: (value) {
              setState(() {
                errorMessage = widget.validator?.call(value);
              });
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
                  if (errorMessage != null)
                    Icon(
                      Icons.info_rounded,
                      color: Color(0xFFF44336),
                    ),
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
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              fontSize: 15,
              color: AppColors.red,
            ),
          ),
      ],
    );
  }
}
