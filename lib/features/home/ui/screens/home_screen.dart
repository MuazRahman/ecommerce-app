import 'package:ecommerce_app/app/assets_path.dart';
import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce_app/features/common/ui/widgets/category_item.dart';
import 'package:ecommerce_app/features/home/ui/widgets/app_bar_action_button.dart';
import 'package:ecommerce_app/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:ecommerce_app/features/common/ui/widgets/product_card.dart';
import 'package:ecommerce_app/features/home/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchTextField(),
              SizedBox(height: 16),
              HomeCarouselSlider(),
              SizedBox(height: 16),
              SectionHeader(
                title: context.localization.categories,
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().moveToCategory();
                },
              ),
              SizedBox(height: 16),
              buildCategoriesSection(),
              SizedBox(height: 16),
              SectionHeader(
                title: context.localization.popular,
                onTapSeeAll: () {},
              ),
              SizedBox(height: 16),
              buildProductSection(),
              SizedBox(height: 16),
              SectionHeader(
                title: context.localization.special,
                onTapSeeAll: () {},
              ),
              SizedBox(height: 16),
              buildProductSection(),
              SizedBox(height: 16),
              SectionHeader(
                title: context.localization.sNew,
                onTapSeeAll: () {},
              ),
              SizedBox(height: 16),
              buildProductSection(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
        ],
      ),
    );
  }

  Widget buildCategoriesSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
        ],
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.logoNavSvg),
      actions: [
        AppBarActionButton(icon: Icons.person_outline, onTap: () {}),
        SizedBox(width: 8),
        AppBarActionButton(icon: Icons.call, onTap: () {}),
        SizedBox(width: 8),
        AppBarActionButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}
