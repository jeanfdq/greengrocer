// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:greengrocer/config/app_data.dart' as AppData;
import 'package:greengrocer/screens/components/order_tile.dart';
import 'package:greengrocer/utils/constants/constants.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Pedidos"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: KUtils.kTitleSize,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: false,
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
        separatorBuilder: (_, _) => SizedBox(height: 10),
        itemBuilder: (_, index) => OrderTile(order: AppData.orders[index]),
        itemCount: AppData.orders.length,
      ),
    );
  }
}
