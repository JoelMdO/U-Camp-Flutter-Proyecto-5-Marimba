import 'package:flutter/material.dart';
import 'package:project_5_marimba/presentation/widget/marimba_bar_widget.dart';
import 'package:project_5_marimba/presentation/widget/marimba_bar_list.dart';

class Marimba extends StatefulWidget {
  const Marimba({super.key});

  @override
  State<Marimba> createState() => _MarimbaState();
}

class _MarimbaState extends State<Marimba> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
          alignment: AlignmentDirectional.topStart,
          fit: StackFit.loose,
          children: [
            Positioned(
                top: 80,
                left: 85,
                child: Image.asset(
                  'assets/MarimbaFrame.png',
                  scale: 0.82,
                )),
            Positioned(
              top: 80,
              left: 105,
              child: SizedBox(
                width: screenWidth,
                height: screenHeight,

                ///[ListView.builder] to create the number of wood bars from the
                ///file marimba_bar_list
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemExtent: 60,
                    itemCount: MarimbaBarDetails.marimbaBarInfo.length,
                    itemBuilder: ((context, index) {
                      final marimbaBarList =
                          MarimbaBarDetails.marimbaBarInfo[index];
                      return MarimbaBar(
                        sound: marimbaBarList.sound,
                        type: marimbaBarList.type,
                      );
                    })),
              ),
            ),
          ]),
    );
  }
}
