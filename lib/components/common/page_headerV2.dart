import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PageHeaderV2 extends StatelessWidget {
  const PageHeaderV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final imagelist = [
      'assets/images/log-in.png',
      'assets/images/24-hours-support.png',
    ];
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.3,
      child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlay: true,
          ),
          items: imagelist
              .map((e) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Image.asset(
                          e,
                          height: 230,
                          width: 230,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}
