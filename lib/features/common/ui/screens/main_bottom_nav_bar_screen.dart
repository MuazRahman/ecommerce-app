import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/features/cart/ui/screens/cart_list_screen.dart';
import 'package:ecommerce_app/features/categories/ui/screens/category_list_screen.dart';
import 'package:ecommerce_app/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce_app/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce_app/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  static const String name = '/main-nav-bar-screen';

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (controller) {
          return _screens[controller.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(
        builder: (controller) {
          return NavigationBar(
            selectedIndex: controller.selectedIndex,
            onDestinationSelected: controller.changeIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: context.localization.home),
              NavigationDestination(
                icon: Icon(Icons.category),
                label: context.localization.category,
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: context.localization.cart,
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border),
                label: context.localization.wishList,
              ),
            ],
          );
        },
      ),
    );
  }
}
