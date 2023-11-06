import 'package:flutter/material.dart';

class WalledWidget extends StatelessWidget {
  const WalledWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      shadowColor: Colors.blueAccent,
      elevation: 4,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Balace'),
            SizedBox(height: 24),
            Text('Rp 5.000.000'),
          ],
        ),
      ),
    );
  }
}
