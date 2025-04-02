import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {

  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.localization.sizes, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.sizes.length,
            itemBuilder: (context, index) {
              String size = widget.sizes[index];
              return GestureDetector(
                onTap: () {
                  selectedSize = size;
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: selectedSize == size ? AppColors.themeColor : null

                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16,),
                  margin: EdgeInsets.only(right: 8,),
                  alignment: Alignment.center,
                  child: Text(size, style: TextStyle(color: selectedSize == size ? Colors.white : null),),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
