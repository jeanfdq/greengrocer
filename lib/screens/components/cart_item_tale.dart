import 'package:flutter/material.dart';
import 'package:greengrocer/config/custom_colors.dart';
import 'package:greengrocer/models/cart_item_model.dart';
import 'package:greengrocer/screens/components/product_quantity.dart';
import 'package:greengrocer/utils/utils.services.dart';

class CartItemTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(double totalItem) totalItem;
  final VoidCallback removeItem;

  const CartItemTile({
    super.key,
    required this.cartItem,
    required this.removeItem,
    required this.totalItem,
  });

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  final utilsServices = UtilsSevices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 2),
      child: ListTile(
        minTileHeight: 90,

        // Imagem do Produto
        leading: Image.asset(widget.cartItem.item.imageURL, fit: BoxFit.fill),

        // Titulo
        title: Text(
          widget.cartItem.item.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),

        // Total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),

        // Quatidade
        trailing: ProductQuantity(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          isRemovable: true,
          resultQuantity: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              widget.totalItem(widget.cartItem.totalPrice());

              if (quantity == 0) {
                widget.removeItem();
              }
            });
          },
        ),
      ),
    );
  }
}
