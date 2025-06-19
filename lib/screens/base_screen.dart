import 'package:flutter/material.dart';
import 'package:greengrocer/screens/cart_tab.dart';
import 'package:greengrocer/screens/home_tab.dart';
import 'package:greengrocer/screens/orders_tab.dart';
import 'package:greengrocer/screens/perfil_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int pageIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [HomeTab(), CartTab(), OrdersTab(), PerfilTab()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
            //pageController.jumpToPage(index);
            pageController.animateToPage(
              index,
              duration: Duration(microseconds: 700),
              curve: Curves.fastEaseInToSlowEaseOut,
            );
          });
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
      ),
    );
  }
}
