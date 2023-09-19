import 'package:aiapait/utils/colors.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  const FilterButton(
      {super.key,
      required this.text,
      required this.isActive,
      required this.onPressed});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool _isActive = false;
  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              width: 1,
              color: _isActive ? Color(AppColors.primary) : Colors.transparent),
          color: Color(AppColors.white),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
              color: Color(_isActive ? AppColors.primary : AppColors.black50)),
        ),
      ),
    );
  }
}
