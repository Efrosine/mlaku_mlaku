import 'package:flutter/material.dart';

class MainFeatureWidget extends StatelessWidget {
  const MainFeatureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MainFeatureComponen(
          destination: '/BHPage',
          iconData: Icons.home_work_outlined,
          title: 'Hotels',
          bg: Colors.blue[300],
        ),
        MainFeatureComponen(
          destination: '',
          iconData: Icons.airplanemode_active,
          title: 'Flights',
          bg: Colors.blue[300],
        ),
      ],
    );
  }
}

class MainFeatureComponen extends StatelessWidget {
  final IconData iconData;
  final String title, destination;
  final Color? bg;
  const MainFeatureComponen({
    super.key,
    required this.destination,
    required this.iconData,
    required this.title,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, destination);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: bg,
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(title),
        ],
      ),
    );
  }
}
