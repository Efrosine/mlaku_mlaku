import 'package:flutter/material.dart';

class GradeStarWidget extends StatelessWidget {
  final int countStar;
  const GradeStarWidget({
    super.key,
    required this.countStar,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 200,
      child: ListView.builder(
        itemCount: countStar,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Icon(
          Icons.star,
          color: Colors.yellow,
          size: 16,
        ),
      ),
    );
  }
}
