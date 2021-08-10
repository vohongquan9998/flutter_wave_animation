import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:flutter_wave_animation/wave/clippathWave.dart';

class WaveWidget extends StatefulWidget {
  final Size size;
  final double yOffset;
  final List<Color> colors;
  final double waveHeight;
  final double waveSpeed;
  WaveWidget(
      {this.size, this.yOffset, this.colors, this.waveHeight, this.waveSpeed});

  @override
  _WaveWidgetState createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {
  AnimationController animationController;
  List<Offset> wavePoint = [];
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
          ..addListener(() {
            wavePoint.clear();
            final double waveSpeed =
                animationController.value * widget.waveSpeed;
            final double fullSphere = animationController.value * Math.pi * 2;
            final double normalizer = Math.cos(fullSphere);
            final double wavewidth = Math.pi / 270;
            final double waveheight = widget.waveHeight;

            for (int i = 0; i <= widget.size.width.toInt(); i++) {
              double cal = Math.sin((waveSpeed - i) * wavewidth);

              wavePoint.add(Offset(
                i.toDouble(),
                cal * waveheight * normalizer + widget.yOffset,
              ));
            }
          });
    animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return ClipPath(
          clipper: ClipperWidget(
            waveList: wavePoint,
          ),
          child: Container(
              width: widget.size.width,
              height: widget.size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: widget.colors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ))),
        );
      },
    );
  }
}
