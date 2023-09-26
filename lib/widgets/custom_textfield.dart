import 'package:flutter/material.dart';

import 'package:aiapait/utils/colors.dart';
import 'package:aiapait/utils/utils.dart';
import 'package:aiapait/widgets/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool obscureText;
  final FocusNode currentNode;
  final FocusNode? nextNode;
  final String? errorMessage;
  final bool isValid;
  final String hintText;
  final IconData? preFixIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.currentNode,
    required this.hintText,
    required this.isValid,
    this.nextNode,
    this.preFixIcon,
    this.suffixIcon,
    this.errorMessage,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 6,
          child: TextFormField(
            obscureText: obscureText,
            focusNode: currentNode,
            controller: controller,
            onChanged: (value) {
              onChanged!(value);
            },
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(context, currentNode, nextNode!);
            },
            decoration: InputDecoration(
              prefixIcon: preFixIcon != null
                  ? Icon(
                      preFixIcon,
                      color: Color(AppColors.primary),
                    )
                  : null,
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (errorMessage != null)
                    const Icon(
                      Icons.info_rounded,
                      color: Color(0xFFF44336),
                    )
                  else if (isValid)
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  const SizedBox(
                    width: 2,
                  ),
                  if (suffixIcon != null)
                    Center(
                      child: suffixIcon,
                    ),
                  const SizedBox(
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
              hintText: hintText,
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
