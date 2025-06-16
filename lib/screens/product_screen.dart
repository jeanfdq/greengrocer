import 'package:flutter/material.dart';
import 'package:greengrocer/config/custom_colors.dart';
import 'package:greengrocer/models/product_item_model.dart';
import 'package:greengrocer/screens/components/product_quantity.dart';
import 'package:greengrocer/utils/components/custom_button_login.dart';
import 'package:greengrocer/utils/constants/constants.dart';
import 'package:greengrocer/utils/utils.services.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.productItem});

  final ProductItemModel productItem;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final utilsServices = UtilsSevices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.productItem.imageURL.trim(),
                  child: Image.asset(widget.productItem.imageURL),
                ),
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.blueGrey, offset: Offset(0, 2)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.productItem.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          ProductQuantity(
                            suffixText: widget.productItem.unit.trim(),
                            value: cartItemQuantity,
                            resultQuantity: (quantity) {
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            },
                          ),
                        ],
                      ),
                      Text(
                        utilsServices.priceToCurrency(widget.productItem.price),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(widget.productItem.descript * 50),
                          ),
                        ),
                      ),
                      CustomButtonLogin(
                        buttonHeight: 50,
                        backgroud: Colors.green,
                        icon: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                        label: "Adicionar",
                        labelColor: Colors.white,
                        radius: KUtils.kRadiusDefault,
                        action: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 15,
            child: SafeArea(
              child: GestureDetector(
                child: Icon(Icons.arrow_back_ios, size: 32),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
