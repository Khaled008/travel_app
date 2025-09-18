//1
//this page will be a custom carousel slider
//contain 3 pics for welcome with scrollable
// by using pageview.builder with axis.vertical
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];
  List text = [
    [
      AppLargeText(text: 'Trips'),
      AppText(text: 'Mountains', size: 30),
      AppText(
        text:
            'Mountain hikes give you an incredible sense of freedom along with endurance test.',
        color: AppColors.textColor2,
        size: 14,
      )
    ],
    [
      AppLargeText(text: 'Discover'),
      AppText(text: 'Heights', size: 30),
      AppText(
        text:
            'Highland trekking is an exciting experience that gives you more confidence to explore the landscape from above.',
        color: AppColors.textColor2,
        size: 14,
      )
    ],
    [
      AppLargeText(text: 'Explore'),
      AppText(text: 'Nature', size: 30),
      AppText(
        text:
            'Exploring nature and stunning scenery is a unique adventure that offers enjoyment, tranquility and contemplation.',
        color: AppColors.textColor2,
        size: 14,
      )
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/${images[index]}'),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text[index][0],
                          text[index][1],
                          text[index][2],
                          SizedBox(
                            height: 40,
                          ),
                          ResponsiveButton(
                            width: 135,
                            onTap: () {
                              if (index < images.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                BlocProvider.of<AppCubits>(context).getData();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: List.generate(images.length, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
