import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/app/assets_path.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name);
      },
      child: Card(
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              Container(
                height: 120,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  color: AppColors.themeColor.withOpacity(0.15),
                  image: productModel.photos.isNotEmpty ? DecorationImage(
                    image: NetworkImage(productModel.photos.first ),
                    fit: BoxFit.cover,
                  ) : null,
                ),
                child: productModel.photos.isEmpty ? Icon(Icons.error_outline_sharp) : null,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${productModel.currentPrice} ৳', style: TextStyle(color: AppColors.themeColor, fontWeight: FontWeight.w600),),
                        Wrap(
                          children: [
                            Icon(Icons.star, size: 18, color: Colors.amber,),
                            Text('${productModel.rating}', style: TextStyle(fontWeight: FontWeight.w500),),
                          ],
                        ),
                        Card(
                          color: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Icon(Icons.favorite_border, size: 14, color: Colors.white,),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
