import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  static const String name = '/create-review';

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
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
        title: Text(context.localization.createReview),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Form(
          child: Column(
            spacing: 24,
            children: [
              SizedBox(height: 24,),
              TextFormField(
                decoration: InputDecoration(hintText: context.localization.firstName, hintStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),),
              TextFormField(
                decoration: InputDecoration(hintText: context.localization.lastName, hintStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),),
              TextFormField(
                decoration: InputDecoration(
                  hintText: context.localization.writeReview, hintStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey,),
                  contentPadding: EdgeInsets.all(16)
                ),
                maxLines: 7,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.maxFinite, 48)
                ),
                  onPressed: () {},
                  child: Text(context.localization.submit, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
            ],
          ),
        ),
      ),
    );
  }
}
