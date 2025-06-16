import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double buttonHeight;
  final Color backgroud;
  final double borderWidth;
  final Color borderColor;
  final Icon? icon;
  final String label;
  final Color labelColor;
  final double radius;
  final VoidCallback action;

  const CustomButton({
    super.key,
    required this.buttonHeight,
    required this.backgroud,
    required this.label,
    required this.labelColor,
    required this.action,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.icon,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroud),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(radius)),
            ),
          ),
          side: borderWidth > 0
              ? WidgetStatePropertyAll(
                  BorderSide(color: borderColor, width: borderWidth),
                )
              : null,
        ),
        onPressed: action,
        icon: icon,
        label: Text(
          label.trim(),
          style: TextStyle(color: labelColor, fontSize: 18),
        ),
      ),
    );
  }
}
