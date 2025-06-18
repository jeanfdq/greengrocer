import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:greengrocer/models/cart_item_model.dart';
import 'package:greengrocer/models/order_model.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

class UtilsServices {
  // price formatter
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  Size sizeScreen(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  MaskTextInputFormatter maskNumberFormatter(String mask) {
    return MaskTextInputFormatter(
      mask: mask,
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }

  String getUUID() {
    return Uuid().v1();
  }

  int getRandomNumber() => Random().nextInt(1000);

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

  OrderModel makeOrder(List<CartItemModel> items) {
    double total = 0;

    for (var element in items) {
      total += element.totalPrice();
    }

    return OrderModel(
      id: getRandomNumber().toString(),
      createdOrder: DateTime.now(),
      pixOverDue: DateTime.parse("2026-12-01 14:00"),
      items: items,
      status: "pending_payment",
      pixCopyAndPaste: Uuid().v8g(),
      total: total,
    );
  }
}
