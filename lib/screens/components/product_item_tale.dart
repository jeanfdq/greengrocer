import 'package:flutter/material.dart';
import 'package:greengrocer/config/custom_colors.dart';
import 'package:greengrocer/models/product_item_model.dart';
import 'package:greengrocer/utils/utils.services.dart';

class ProductItemTale extends StatefulWidget {
  const ProductItemTale({
    super.key,
    required this.productItem,
    required this.onTapCart,
    required this.onTapProduct,
  });

  final ProductItemModel productItem;
  final void Function(GlobalKey) onTapCart;
  final VoidCallback onTapProduct;

  @override
  State<ProductItemTale> createState() => _ProductItemTaleState();
}

class _ProductItemTaleState extends State<ProductItemTale> {
  final GlobalKey gkImagem = GlobalKey();

  IconData tileIcon = Icons.add_shopping_cart_outlined;

  Future<void> switchTileIcon() async {
    setState(() => tileIcon = Icons.check);
    await Future.delayed(Duration(seconds: 2));
    setState(() => tileIcon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.onTapProduct,
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
                      tag: widget.productItem.imageURL.trim(),
                      child: Container(
                        key: gkImagem,

                        child: Image.asset(widget.productItem.imageURL),
                      ),
                    ),
                  ),
                  Text(
                    widget.productItem.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: UtilsServices().priceToCurrency(
                            widget.productItem.price,
                          ),
                          style: TextStyle(
                            color: CustomColors.customSwatchColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: ' / ${widget.productItem.unit}',
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
            onTap: () {
              widget.onTapCart(gkImagem);
              switchTileIcon();
            },
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
              child: Icon(tileIcon, color: Colors.white, size: 26),
            ),
          ),
        ),
      ],
    );
  }
}
