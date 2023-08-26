import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// ignore: must_be_immutable
class MarimbaBar extends StatefulWidget {
  ///[type] and [sound] parameters received from the list of marimba wood bars
  String type, sound;

  MarimbaBar({super.key, required this.sound, required this.type});

  @override
  State<MarimbaBar> createState() => _MarimbaBarState();
}

class _MarimbaBarState extends State<MarimbaBar>
    with SingleTickerProviderStateMixin {
  ///
  late AnimationController _controller;
  bool isTapped = false;
  final AudioPlayer audioPlayer = AudioPlayer();
  Timer? timer;
  bool isVisible = false;
  bool isDrumbVisible = false;

  ///[controller] init state for the animation
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  ///[controller] and [audioPlayer] dispose
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    audioPlayer.dispose();
  }

  ///[timer] for resize back the wood bar and disappear the music symbol
  void startTimer() {
    timer = Timer(const Duration(milliseconds: 100), () {
      setState(() {
        isTapped = false;
      });
    });
  }

  void finishTimer() {
    timer = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        isVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (audioPlayer.state == PlayerState.playing) {
            audioPlayer.stop();
            isVisible = false;
          } else {
            setState(() {
              // To scale the widget with Transform.
              isTapped = true;
            });

            ///[widget.sound] from the marimba list
            audioPlayer.play(AssetSource(widget.sound), volume: 30.0);

            ///[Timer] to take the widget back to scale
            startTimer();
            isVisible = true;
            isDrumbVisible = true;
            finishTimer();
          }
        },
        child: Stack(
          children: [
            AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                      scale: isTapped ? 2.0 : 1.0,
                      child: Image.asset(widget.type));
                }),
            Positioned(
              left: 125,
              child: AnimatedOpacity(
                  opacity: isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset('assets/SongSymbol.png')),
            ),
          ],
        ));
  }
}
