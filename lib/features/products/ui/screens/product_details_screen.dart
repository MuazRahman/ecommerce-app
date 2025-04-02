import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/features/products/ui/screens/review_screen.dart';
import 'package:ecommerce_app/features/products/ui/widgets/color_picker.dart';
import 'package:ecommerce_app/features/products/ui/widgets/increment_decrement_counter_widget.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_image_carousel_slider.dart';
import 'package:ecommerce_app/features/products/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageCarouselSlider(),
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
                                      Text('Nike 320 New Collection',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600, fontSize: 18,),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.star, color: Colors.amber, size: 20,),
                                              Text('4.2'),
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
                        SizedBox(height: 16,),
                        ColorPicker(
                          colors: ['Red', 'White', 'Black', 'Brown'],
                          onChange: (selectedColor) {
                            print(selectedColor);
                          }
                        ),
                        SizedBox(height: 16,),
                        SizePicker(
                            sizes: ['S', 'M', 'L', 'XL'],
                            onChange: (selectedColor) {
                              print(selectedColor);
                            }
                        ),
                        SizedBox(height: 16,),
                        Text(context.localization.description, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                        SizedBox(height: 8,),
                        Text('''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                        style: TextStyle(color: Colors.black54),
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
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.1),
            borderRadius: BorderRadius.only(
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
                  Text('\$ 1800', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.themeColor,),),
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
