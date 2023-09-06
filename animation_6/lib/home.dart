import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color getRandomColor() => Color(0xFF000000 + Random().nextInt(0x00FFFFFF));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
            tween: ColorTween(begin: getRandomColor(), end: getRandomColor()),
            onEnd: () {
              setState(() {
                getRandomColor();
              });
            },
            duration: const Duration(seconds: 1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            builder: (context, color, child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                child: child,
              );
            }),
      ),
    );
  }
}
