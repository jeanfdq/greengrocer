import 'package:flutter/material.dart';
import 'package:greengrocer/config/custom_colors.dart';
import 'package:greengrocer/models/product_item_model.dart';
import 'package:greengrocer/utils/utils.services.dart';

class ProductItemTale extends StatelessWidget {
  const ProductItemTale({
    super.key,
    required this.productItem,
    required this.onTapCart,
    required this.onTapProduct,
  });

  final ProductItemModel productItem;
  final VoidCallback onTapCart;
  final VoidCallback onTapProduct;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTapProduct,
          child: Card(
            elevation: 1,
            shadowColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: productItem.imageURL.trim(),
                      child: Image.asset(productItem.imageURL),
                    ),
                  ),
                  Text(
                    productItem.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: UtilsServices().priceToCurrency(
                            productItem.price,
                          ),
                          style: TextStyle(
                            color: CustomColors.customSwatchColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: ' / ${productItem.unit}',
                          style: TextStyle(
                            color: Colors.blueGrey.shade400,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Carrinho de Compra
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: onTapCart,
            child: Container(
              width: 35,
              height: 40,
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
