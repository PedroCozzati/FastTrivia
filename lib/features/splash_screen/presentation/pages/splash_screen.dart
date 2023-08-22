import 'package:fasttrivia1/common/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;
  late Animation<double> _fadeInFadeOut2;

  @override
  dispose() {
    animation.dispose(); // you need this
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 2), () {
    // if (!isInternet) {
    //   Future.delayed(const Duration(seconds: 2), () {
    //     Navigator.pushReplacementNamed(context, 'error_page');
    //   });
    // }
    Future.delayed(const Duration(seconds: 4), () {

      Navigator.pushReplacementNamed(context, 'home');
    });
    // });

    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);
    _fadeInFadeOut2 = Tween<double>(begin: 0.5, end: 1).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context: context);
    return Container(
      height: size.height,
      width: size.width,
      color: AppColors.thirdColor,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            Container(
              child: FadeTransition(
                opacity: _fadeInFadeOut2,
                child: Center(child: Image.asset('assets/img.png')),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FadeTransition(
                  opacity: _fadeInFadeOut,
                  child: Container(
                    height: size.height / 2,
                    width: size.width / 1.2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Row(
                            children: [
                              Container(
                                color: AppColors.mainColor,
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Row(
                            children: [
                              Container(
                                color: AppColors.secondColor,
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Container(
                                color: AppColors.mainColor,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              color: AppColors.secondColor,
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _fadeInFadeOut,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
                          children: [
                            Container(
                              color: AppColors.secondColor,
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200),
                        child: Row(
                          children: [
                            Container(
                              color: AppColors.mainColor,
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: AppColors.mainColor,
                            width: 50,
                            height: 50,
                          ),
                          Container(
                            color: AppColors.secondColor,
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
