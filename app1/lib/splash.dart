import 'package:app1/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (c) => Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset("assets/logo/logo.svg")),
    );
  }
}
