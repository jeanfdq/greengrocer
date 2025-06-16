import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UtilsSevices {
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
}
