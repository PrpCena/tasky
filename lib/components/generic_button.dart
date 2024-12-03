import 'package:flutter/material.dart';
import 'package:tasky/themes/colors.dart';

class GenericButton extends StatelessWidget {
  final String label;
  final GestureTapCallback onPressed;

  const GenericButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.taskText,
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.taskText,
          ),
        ),
      ),
    );
  }
}
