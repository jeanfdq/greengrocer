import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/GetX/values_controller.dart';
import 'package:greengrocer/screens/cart_tab.dart';
import 'package:greengrocer/screens/home_tab.dart';
import 'package:greengrocer/screens/orders_tab.dart';
import 'package:greengrocer/screens/perfil_tab.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final valuesController = ValuesController();

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [HomeTab(), CartTab(), OrdersTab(), PerfilTab()],
      ),
      bottomNavigationBar: GetBuilder<ValuesController>(
        init: valuesController,

        builder: (ctrl) {
          return BottomNavigationBar(
            currentIndex: ctrl.homePageIndex,
            onTap: (index) {
              valuesController.setValue(index);
              ctrl.homePageIndex = index;

              pageController.animateToPage(
                index,
                duration: Duration(microseconds: 700),
                curve: Curves.fastEaseInToSlowEaseOut,
              );
            },

            backgroundColor: Colors.green,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withAlpha(90),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: "Carrinho",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "Pedidos"),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: "Perfil",
              ),
            ],
          );
        },
      ),
    );
  }
}
