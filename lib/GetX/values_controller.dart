import 'package:get/get.dart';

class ValuesController extends GetxController {
  int homePageIndex = 0;

  void setValue(int value) {
    homePageIndex = value;

    update();
  }
}
