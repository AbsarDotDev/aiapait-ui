import 'package:aiapait/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool isValid;
  final bool isLoading;
  final VoidCallback onPressed;

  CustomButton({
    Key? key,
    required this.buttonText,
    required this.isValid,
    required this.isLoading,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isLoading ? 48.0 : 200,
      height: isLoading ? 48.0 : null,
      child: InkWell(
        onTap: isValid && !isLoading ? onPressed : null,
        child: Container(
          decoration: BoxDecoration(
            color: isLoading
                ? Color(AppColors.bgColor)
                : isValid
                    ? Color(AppColors.primary)
                    : Color(AppColors.bgColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(isLoading ? 12.0 : 16.0),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
