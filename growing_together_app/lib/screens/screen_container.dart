import 'package:flutter/material.dart';
import 'package:growing_together/boottom_nav/bottom_nav.dart';
import 'package:growing_together/boottom_nav/nav_options.dart';
import 'package:growing_together/screens/home_page.dart';
import 'package:growing_together/screens/view_vaccines.dart';

import '../ui_utils/colors.dart';

class ScreenContainer extends StatefulWidget {
  const ScreenContainer({Key? key}) : super(key: key);

  @override
  State<ScreenContainer> createState() => _ScreenContainerState();
}

class _ScreenContainerState extends State<ScreenContainer> {
  int currentScreen = 0;

  void setScreen(int i) {
    setState(() {
      currentScreen = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white1,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 50,
            width: MediaQuery.of(context).size.width,
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.transparent, Colors.transparent, Colors.purple],
                  stops: [0.0, 0.5, 0.9, 1.0], // 10% purple, 80% transparent, 10% purple
                ).createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: Builder(builder: (_) {
                return NavOptions.navBarOptions[NavOptions.navBarTitles[currentScreen]]!;
              }),
            ),
          ),
          Center(child: BottomNavBar(screenChangeCallback: setScreen,))
        ],
      ),
    );
  }
}
