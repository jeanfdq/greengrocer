import 'package:flutter/material.dart';
import 'package:greengrocer/config/custom_colors.dart';

class CategoryTale extends StatelessWidget {
  const CategoryTale({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? CustomColors.customSwatchColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            category,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : CustomColors.customContrastColor,
              fontSize: isSelected ? 16 : 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
