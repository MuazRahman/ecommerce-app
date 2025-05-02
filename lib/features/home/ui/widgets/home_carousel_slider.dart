import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/core/widgets/centered_circular_progress_indicatior.dart';
import 'package:ecommerce_app/features/common/controller/home_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int _selectedSlider = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeSliderController>(
      builder: (sliderController) {
        return Visibility(
          visible: sliderController.getSlidersInProgress == false,
          replacement: const SizedBox(
            height: 200,
            child: CenteredCircularProgressIndicatior(),
          ),
          child: Visibility(
            visible: sliderController.sliders.isNotEmpty,
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    viewportFraction: 0.9,
                    autoPlay: sliderController.sliders.length > 1 ? true : false,
                    autoPlayInterval: Duration(seconds: 3),
                    onPageChanged: (index, reason) {
                      _selectedSlider = index;
                      setState(() {});
                    },
                  ),
                  items:
                      sliderController.sliders.map((slider) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                color: AppColors.themeColor,
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(slider.photoUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  slider.description,
                                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < sliderController.sliders.length; i++)
                      Container(
                        height: 16,
                        width: 16,
                        margin: EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey),
                          color:
                              _selectedSlider == i
                                  ? AppColors.themeColor
                                  : Colors.white,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
