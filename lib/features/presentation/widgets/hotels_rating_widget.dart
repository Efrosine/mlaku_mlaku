import 'package:flutter/material.dart';

class HotelsRating extends StatelessWidget {
  String? desc;
  final double rating;
  HotelsRating({super.key, this.desc, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.local_activity,
        ),
        Text('$rating/5'),
        SizedBox(width: 4),
        Text(desc == null ? '' : desc!)
      ],
    );
  }
}
