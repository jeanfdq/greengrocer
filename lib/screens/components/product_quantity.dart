import 'package:flutter/material.dart';
import 'package:greengrocer/config/custom_colors.dart';

class ProductQuantity extends StatelessWidget {
  final bool isRemovable;
  final int value;
  final String suffixText;
  final Function(int quantity) resultQuantity;

  const ProductQuantity({
    super.key,
    required this.suffixText,
    required this.value,
    this.isRemovable = false,
    required this.resultQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 45,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(45)),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        // Para que a row nao cresce mais que os seus filhos
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            color: isRemovable && value <= 1 ? Colors.redAccent : Colors.grey,
            icon: isRemovable && value <= 1
                ? Icons.delete_forever
                : Icons.remove,
            iconColor: Colors.white,
            onPressed: () {
              if ((value == 1 && !isRemovable) || value == 0) {
                return;
              }

              int resultTotal = value - 1;
              resultQuantity(resultTotal);
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                "$value $suffixText",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _QuantityButton(
            color: CustomColors.customSwatchColor,
            icon: Icons.add,
            iconColor: Colors.white,
            onPressed: () {
              int resultTotal = value + 1;
              resultQuantity(resultTotal);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({
    required this.color,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
  });

  final IconData icon;
  final Color iconColor;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
