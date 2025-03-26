import 'package:ecommerce_app/app/app_color.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 8),
          color: AppColors.themeColor.withOpacity(0.15),
          elevation: 0,
          child: Padding(padding: EdgeInsets.all(16),
            child: const Icon(
              Icons.computer, size: 48, color: AppColors.themeColor,),),
        ),
        Text('Computers', style: TextStyle(color: AppColors.themeColor, fontWeight: FontWeight.w500, fontSize: 16,),),
      ],
    );
  }
}
