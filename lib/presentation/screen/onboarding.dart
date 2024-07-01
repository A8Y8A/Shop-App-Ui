import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz2/core/utils/assets_manager.dart';
import 'package:quiz2/core/utils/color_manager.dart';
import 'package:quiz2/core/utils/string_manager.dart';
import 'package:quiz2/presentation/widget/nav_bar.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widget/custom_button.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.1,
            right: size.width * 0.16,
            top: size.height * 0.03,
            bottom: size.height * 0.001,
          ),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: StringManager.manrope,
                    color: Colors.white,
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    const TextSpan(text: StringManager.heading1),
                    WidgetSpan(
                      child: SvgPicture.asset(
                        AssetsManager.emoji,
                        width: size.width * 0.1,
                        height: size.width * 0.1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringManager.headingList[index],
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: ColorManager.lightGrey,
                            fontFamily: StringManager.manrope,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: size.height * 0.05),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                            axisDirection: Axis.horizontal,
                            effect: const SlideEffect(
                              spacing: 8.0,
                              radius: 1.0,
                              dotWidth: 30.0,
                              dotHeight: 5.0,
                              paintStyle: PaintingStyle.fill,
                              //strokeWidth: 1.5,
                              dotColor: ColorManager.lightGrey,
                              activeDotColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.08),
                        SvgPicture.asset(
                          AssetsManager.imageList[index],
                          height: size.height * 0.2,
                        ),
                      ],
                    );
                  },
                ),
              ),
              CustumButtom(
                text: StringManager.getStarted,
                press: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                width: 300,
                height: 60,
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
