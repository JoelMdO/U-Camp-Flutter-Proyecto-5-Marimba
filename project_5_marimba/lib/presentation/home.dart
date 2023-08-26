import 'package:flutter/material.dart';
import 'package:project_5_marimba/presentation/widget/app_bar.dart';
import 'package:project_5_marimba/presentation/widget/bottom_nav_bar.dart';
import 'package:project_5_marimba/presentation/widget/marimba_full_body.dart';
import 'package:project_5_marimba/presentation/widget/marimba_title.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MarimbaAppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(top: 5, child: buildTitleMarimba()),
          const Padding(padding: EdgeInsets.only(top: 10), child: Marimba()),
        ],
      ),
      bottomNavigationBar: const MarimbaBottomNavBar(),
    );
  }
}
