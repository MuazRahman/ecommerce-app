import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/core/widgets/centered_circular_progress_indicatior.dart';
import 'package:ecommerce_app/features/common/controller/category_controller.dart';
import 'package:ecommerce_app/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce_app/features/common/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  static const String name = '/category-list';

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CategoryController _categoryController = Get.find<CategoryController>();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _categoryController.getCategoryList();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _categoryController.getCategoryList();
    }
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: Icon(Icons.keyboard_arrow_left_rounded, size: 36,),
          ),

          title: Text(context.localization.category),
        ),
        body: GetBuilder<CategoryController>(
          builder: (controller) {
            if (controller.isInitialLoading) {
              return const CenteredCircularProgressIndicatior();
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async{
                        controller.refreshList();
                      },
                      child: GridView.builder(
                        controller: _scrollController,
                        itemCount: controller.categoryList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          return FittedBox(child: CategoryItem(categoryModel: controller.categoryList[index],));
                        },
                      ),
                    ),
                  ),
                  Visibility(
                      visible: controller.isLoading,
                      child: const LinearProgressIndicator()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
