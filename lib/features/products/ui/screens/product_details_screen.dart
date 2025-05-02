import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/core/widgets/centered_circular_progress_indicatior.dart';
import 'package:ecommerce_app/features/products/ui/controller/product_details_controller.dart';
import 'package:ecommerce_app/features/products/ui/screens/review_screen.dart';
import 'package:ecommerce_app/features/products/ui/widgets/color_picker.dart';
import 'package:ecommerce_app/features/products/ui/widgets/increment_decrement_counter_widget.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_image_carousel_slider.dart';
import 'package:ecommerce_app/features/products/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController = ProductDetailsController();

  @override
  void initState() {
    super.initState();
    _productDetailsController.getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_rounded, size: 36),
        ),
        title: Text(context.localization.productDetails),),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (controller) {
          if (controller.inProgress) {
            return const CenteredCircularProgressIndicatior();
          }

          if (controller.errorMessage != null) {
            return Center(
              child: Text(controller.errorMessage!),
            );
          }
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImageCarouselSlider(imageList: controller.product.photos,),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(controller.product.title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600, fontSize: 18,),
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.star, color: Colors.amber, size: 20,),
                                                  Text('${controller.product.rating}'),
                                                ],
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(context, ReviewScreen.name);
                                                  },
                                                  child: Text(context.localization.review),),
                                              Card(
                                                color: AppColors.themeColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(4),
                                                  child: Icon(Icons.favorite_border, size: 16, color: Colors.white,),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                  ),
                                  IncrementDecrementCounterWidget(onChange: (int value) {}),
                                ],
                            ),
                            const SizedBox(height: 16,),
                            ColorPicker(
                              colors: controller.product.colors,
                              onChange: (selectedColor) {
                                print(selectedColor);
                              }
                            ),
                            const SizedBox(height: 16,),
                            SizePicker(
                                sizes: controller.product.sizes,
                                onChange: (selectedColor) {
                                  print(selectedColor);
                                }
                            ),
                            const SizedBox(height: 16,),
                            Text(context.localization.description, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                            const SizedBox(height: 8,),
                            Text(controller.product.description,
                            style: const TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildPriceAndAddToCartSection(),
            ],
          );
        }
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.localization.price),
                  Text(_productDetailsController.product.currentPrice.toString(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.themeColor,),),
                ],
              ),
                SizedBox(
                width: 140,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(context.localization.addToCart),),
              ),
            ],
          ),
        );
  }
}
