import 'package:flutter/material.dart';

import 'package:greengrocer/GetX/values_controller.dart';
import 'package:greengrocer/config/custom_colors.dart';
import 'package:greengrocer/models/cart_item_model.dart';
import 'package:greengrocer/screens/components/product_quantity.dart';
import 'package:greengrocer/utils/utils.services.dart';

class CartItemTile extends StatelessWidget {
  final valuesController = ValuesController();
  final utilsServices = UtilsServices();

  final CartItemModel cartItem;
  final Function(double totalItem) totalItem;
  final VoidCallback removeItem;

  CartItemTile({
    super.key,
    required this.cartItem,
    required this.removeItem,
    required this.totalItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 2),
      child: ListTile(
        minTileHeight: 90,

        // Imagem do Produto
        leading: Image.asset(cartItem.item.imageURL, fit: BoxFit.fill),

        // Titulo
        title: Text(
          cartItem.item.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),

        // Total
        subtitle: Text(
          utilsServices.priceToCurrency(cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),

        // Quatidade
        trailing: ProductQuantity(
          suffixText: cartItem.item.unit,
          value: cartItem.quantity,
          isRemovable: true,
          resultQuantity: (quantity) {
            totalItem(cartItem.totalPrice());

            if (quantity == 0) {
              removeItem();
            }
          },
        ),
      ),
    );
  }
}
