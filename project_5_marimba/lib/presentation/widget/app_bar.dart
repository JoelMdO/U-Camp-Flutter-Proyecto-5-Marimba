import 'package:flutter/material.dart';
import 'package:project_5_marimba/presentation/widget/text_styles.dart';

class MarimbaAppBar extends AppBar {
  MarimbaAppBar({super.key})
      : super(
            title: const Text('Marimba').marimbaTextStyles(),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/Waves.png'))),
            ),
            actions: <Widget>[
              Image.asset('assets/ShipWheel.png'),
            ]);
}
