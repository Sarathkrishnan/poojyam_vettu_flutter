import 'package:flutter/material.dart';
import 'package:pooyam_vettu/screens/gameconfig.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, GameConfig.id);
    });
  }

  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.yellow),
          child: Center(
            child: Image.asset(
              'images/logo.png',
              height: deviceWidth * 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
