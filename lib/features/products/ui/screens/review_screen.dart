import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/features/products/ui/screens/create_review_screen.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  static const String name = '/review-screen';

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
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
        title: Text(context.localization.reviews),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Card(
                                      color: Colors.white70,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Icon(
                                          Icons.person_outline,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '\tRabbil Hasan',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  style: TextStyle(color: Colors.black54),
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
                    child: Text('${context.localization.totalReviews} (1000)', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
                  ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CreateReviewScreen.name);
                },
                child: SizedBox(
                  width: 80,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.themeColor,
                    child: Icon(Icons.add, color: Colors.white, size: 36,),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
