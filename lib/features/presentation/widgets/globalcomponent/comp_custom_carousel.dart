import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class CCaraousel extends StatelessWidget {
  const CCaraousel({
    super.key,
    required this.listData,
    required this.height,
  });

  final double height;
  final List<dynamic> listData;

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel.builder(
      itemCount: listData.length,
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        enableInfiniteScroll: true,
        viewportFraction: 1,
        autoPlayInterval: Duration(seconds: 1),
        slideIndicator: CircularSlideIndicator(
          currentIndicatorColor: Colors.blue,
          indicatorRadius: 4,
          itemSpacing: 12,
        ),
      ),
      itemBuilder: (context, index, realIndex) => Container(
          width: double.infinity,
          color: Colors.grey,
          child: Image.asset(
            listData[index],
            fit: BoxFit.cover,
          )),
    );
  }
}
