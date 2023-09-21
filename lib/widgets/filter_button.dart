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
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: isActive ? Color(AppColors.primary) : Colors.transparent,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isActive
                  ? Color(AppColors.primary)
                  : Color(AppColors.black50),
            ),
          ),
        ),
      ),
    );
  }
}
