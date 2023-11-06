import 'package:flutter/material.dart';

class LocationNDistance extends StatelessWidget {
  final String location;
  const LocationNDistance({
    super.key, required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined),
        Text(
          location,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
