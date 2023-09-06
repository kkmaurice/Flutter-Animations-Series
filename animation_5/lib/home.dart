import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isZoomedIn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: isZoomedIn ? Curves.easeInCirc : Curves.bounceInOut,
                  width: isZoomedIn ? 100 : MediaQuery.of(context).size.width,
                  child: Image.asset("assets/images/wallpaper.jpg"),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isZoomedIn = !isZoomedIn;
                  });
                },
                child: Text(isZoomedIn ? "Zoom In" : "Zoom Out")),
          ],
        ));
  }
}
