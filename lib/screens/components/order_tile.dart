import 'package:flutter/material.dart';
import 'package:greengrocer/config/custom_colors.dart';
import 'package:greengrocer/models/order_model.dart';
import 'package:greengrocer/utils/utils.services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    UtilsServices utilsServices = UtilsServices();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Pedido: ${order.id}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
                Text(
                  utilsServices.formatDateTime(order.createdOrder),
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            childrenPadding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            children: [
              SizedBox(
                height: 150,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return Row(
                            children: [
                              Text(
                                "${orderItem.quantity} ${orderItem.item.unit} ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  orderItem.item.name,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Text(
                                utilsServices.priceToCurrency(
                                  orderItem.totalPrice(),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    Expanded(flex: 2, child: Container(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
