import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/data_model.dart';
import 'package:travel_app/misc/colors.dart';

import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  final DataModel place;
  const DetailPage({super.key, required this.place});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'http://mark.bslmeiyu.com/uploads/${widget.place.img}'),
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AppCubits>(context).goHome();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert_rounded),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 700,
                decoration: BoxDecoration(
                  color: Colors.white, //
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: widget.place.name,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppLargeText(
                            text: '\$ ${widget.place.price}',
                            color: AppColors.mainColor),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(
                            text: widget.place.location,
                            color: AppColors.textColor1),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                Icons.star,
                                color: index < widget.place.stars
                                    ? AppColors.starColor
                                    : AppColors.mainColor.withOpacity(0.3),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        AppText(
                            text: '(${widget.place.stars}.0)',
                            color: AppColors.textColor2),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AppLargeText(
                      text: 'People',
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(
                        text: 'Number of people in your group',
                        color: AppColors.mainTextColor),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(
                        widget.place.people,
                        (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: AppButtons(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : Colors.grey.withOpacity(0.3),
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                size: 50,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: 'Description',
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppText(
                      text: widget.place.description,
                      color: AppColors.mainTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    color: AppColors.textColor1,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor1,
                    isIcon: true,
                    icon: Icons.favorite_border,
                    size: 60,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ResponsiveButton(
                    isResponsive: true,
                    onTap: () {
                      // Booking logic can be added here
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
