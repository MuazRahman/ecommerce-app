import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/app/assets_path.dart';
import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce_app/features/products/ui/widgets/increment_decrement_counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  static const String name = '/cart-list';


  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavBarController>().backToHome();
              },
              icon: Icon(Icons.keyboard_arrow_left_rounded, size: 36),
            ),
            title: Text(context.localization.cart, style: TextStyle(color: AppColors.darkBlue),),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(
                          height: 160,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(AssetsPath.dummyShoePng, width: 56,),
                                  SizedBox(width: 24,),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('New Year Special Shoe', style: TextStyle(color: AppColors.darkBlue.withOpacity(0.7), fontSize: 19, fontWeight: FontWeight.w600,),),
                                            GestureDetector(
                                              onTap: () {
                                                print('object');
                                              },
                                              child: Icon(Icons.delete_outline, color: AppColors.darkBlue, size: 28,),
                                            ),

                                          ],
                                        ),
                                        SizedBox(height: 4,),
                                        Text('Color: Black,  Size: XL', style: TextStyle(color: AppColors.darkBlue, fontSize: 14),),
                                        SizedBox(height: 20,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('\$100', style: TextStyle(color: AppColors.themeColor, fontSize: 20, fontWeight: FontWeight.bold,),),
                                            IncrementDecrementCounterWidget(onChange: (int value) {}),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),

              _buildTotalReviewsAndCreateReview(),
            ],
          ),
      ),
    );
  }


  Container _buildTotalReviewsAndCreateReview() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: AppColors.themeColor.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.localization.totalPrice,
                  style: TextStyle(color: AppColors.darkBlue,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),),
                Text('\$100,000.00', style: TextStyle(fontSize: 20, color: AppColors.themeColor, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: SizedBox(
              width: 140,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(context.localization.checkOut),),
            ),
          ),
        ],
      ),
    );
  }

}