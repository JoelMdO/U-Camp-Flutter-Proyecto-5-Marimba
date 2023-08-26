import 'package:flutter/material.dart';
import 'package:project_5_marimba/presentation/widget/text_styles.dart';

Widget buildTitleMarimba() {
  return Row(children: [
    Transform.flip(
        flipX: true,
        child: Image.asset(
          'assets/DrumbStick.png',
          width: 100,
          height: 100,
        )),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('To Play, beat..').marimbaTextStyles(),
      const Text('the Marimba Wood Bars..').marimbaTextStyles(),
    ])
  ]);
}
