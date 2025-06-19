import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:greengrocer/config/app_data.dart' as AppData;
import 'package:greengrocer/config/custom_colors.dart';
import 'package:greengrocer/screens/components/category_tale.dart';
import 'package:greengrocer/screens/components/product_item_tale.dart';
import 'package:greengrocer/screens/product_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = "Todas";

  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCartAnimation;

  void itemSelectedCartAnimation(GlobalKey gkImage) {
    runAddToCartAnimation(gkImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Green",
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "grocer",
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => debugPrint('Carrinho 1'),
              child: AddToCartIcon(
                key: globalKeyCartItems,
                badgeOptions: const BadgeOptions(
                  active: true,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                icon: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),

      body: AddToCartAnimation(
        cartKey: globalKeyCartItems,
        opacity: 0.85,
        dragAnimation: const DragToCartAnimationOptions(),
        jumpAnimation: const JumpAnimationOptions(),
        createAddToCartAnimation: (runAddToCartAnimation) {
          this.runAddToCartAnimation = runAddToCartAnimation;
        },

        child: Column(
          children: [
            // Pesquisa do App
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 21,
                  ),
                  hintText: "Pesquise aqui...",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  ),
                ),
              ),
            ),

            // Categorias
            Container(
              padding: EdgeInsets.only(left: 15),
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => CategoryTale(
                  category: AppData.categories[index],
                  isSelected: AppData.categories[index] == selectedCategory,
                  onPressed: () {
                    setState(() {
                      selectedCategory = AppData.categories[index];
                    });
                  },
                ),
                separatorBuilder: (_, index) => SizedBox(width: 10),
                itemCount: AppData.categories.length,
              ),
            ),

            // List GridView
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemCount: AppData.items.length,
                itemBuilder: (_, index) {
                  return ProductItemTale(
                    productItem: AppData.items[index],
                    // cartAnimationMethod: itemSelectedCartAnimation,
                    onTapCart: itemSelectedCartAnimation,
                    onTapProduct: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductScreen(
                              productItem: AppData.items[index],
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
