import 'package:aiapait/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isDisabled;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isDisabled || widget.isLoading ? null : widget.onPressed,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: widget.isDisabled ? Colors.grey : Color(AppColors.primary),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: widget.isLoading
              ? CircularProgressIndicator(
                  backgroundColor:
                      widget.isDisabled ? Colors.grey : Colors.blue,
                )
              : Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
