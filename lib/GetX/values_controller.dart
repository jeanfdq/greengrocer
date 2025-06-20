import 'package:get/get.dart';

class ValuesController extends GetxController {
  RxInt homePageIndex = 0.obs;

  void setValue(int newValue) {
    homePageIndex.value = newValue;
  }
}
