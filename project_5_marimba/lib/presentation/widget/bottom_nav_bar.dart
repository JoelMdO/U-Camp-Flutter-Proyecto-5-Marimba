import 'package:flutter/material.dart';

class MarimbaBottomNavBar extends StatelessWidget {
  const MarimbaBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 70,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Waves.png'))),
    );
  }
}
