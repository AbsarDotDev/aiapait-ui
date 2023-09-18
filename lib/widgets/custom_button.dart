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
        padding: EdgeInsets.all(12),
        height: 48,
        width: widget.isLoading ? 48 : double.infinity,
        decoration: BoxDecoration(
          color: widget.isDisabled ? Colors.grey : Color(AppColors.primary),
          borderRadius: widget.isLoading
              ? BorderRadius.circular(50)
              : BorderRadius.circular(4),
        ),
        child: Center(
          child: widget.isLoading
              ? CircularProgressIndicator(
                  color: Colors.white,
                  backgroundColor:
                      widget.isDisabled ? Colors.white : Colors.transparent,
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
