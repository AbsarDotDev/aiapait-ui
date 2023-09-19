import 'package:aiapait/utils/colors.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final String selectedFilter;

  final VoidCallback onPressed;

  const FilterButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.selectedFilter});

  bool get isActive => text == selectedFilter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 1,
            color: isActive ? Color(AppColors.primary) : Colors.transparent,
          ),
          color: Color(AppColors.white),
        ),
        child: Text(
          text,
          style: TextStyle(
            color:
                isActive ? Color(AppColors.primary) : Color(AppColors.black50),
          ),
        ),
      ),
    );
  }
}
