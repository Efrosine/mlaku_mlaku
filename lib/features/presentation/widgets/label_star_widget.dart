import 'package:flutter/material.dart';

import 'grade_star_widget.dart';

class LabelNStarWidget extends StatelessWidget {
  final int countStar;
  const LabelNStarWidget({
    super.key,
    required this.countStar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 8,
        ),
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.indigo[50], borderRadius: BorderRadius.circular(24)),
          child: Row(
            children: [
              Icon(Icons.location_city),
              Text('Hotels'),
            ],
          ),
        ),
        GradeStarWidget(
          countStar: countStar,
        ),
      ],
    );
  }
}
