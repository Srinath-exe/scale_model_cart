import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:scale_model_cart/Screens/Authentication/login.dart';
import 'package:scale_model_cart/constants/constants.dart';
import 'package:scale_model_cart/widgets/buttons.dart';
import 'package:video_player/video_player.dart';

import 'Authentication/authscreen.dart';

class FlashScreen extends StatefulWidget {
  FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/MainAnim.mp4')
      ..initialize().then((_) {
        Future.delayed(Duration(seconds: 1))
            .then((value) => {_controller.play()});

        setState(() {});
        Future.delayed(Duration(seconds: 20))
            .then((value) => {_controller.pause()});
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 10, end: 1),
              duration: const Duration(seconds: 3),
              child: Container(child: CircleAvatar()),
              builder: (BuildContext context, double scale, Widget? child) {
                return Container(
                  height: GetSize().height(context) * 0.5,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 20 * scale,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 250,
                          width: GetSize().width(context) * scale,
                          child: Transform.scale(
                              scale: scale, child: VideoPlayer(_controller)),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "“Big Dreams, Small Cars”",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: accent, fontSize: 28),
                  ),
                  SizedBox(
                    height: GetSize().height(context) * 0.02,
                  ),
                  Text(
                    "Welcome to a world where comfort, elegance, agility and traditional craftsmanship of the original automobile combines with the boldness and style of a sportsman.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: light.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            ThemeButton(
              elevation: 20,
              width: GetSize().width(context) * 0.9,
              bgColor: secondaryLight,
              txtColor: accent,
              text: "Get Started",
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      PageRouteTransitionBuilder(
                          page: AuthScreen(),
                          curve: Curves.easeOut,
                          duration: Duration(milliseconds: 600),
                          effect: TransitionEffect.fade));
                });
              },
            )
          ],
        ),
      )),
    );
  }
}
