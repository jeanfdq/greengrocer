import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/screens/pages_routes/pages_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4), () {
      if (mounted) {
        Get.offNamed(PagesRoutes.signInRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Image.asset("assets/appIcons/logo_fn.png", scale: 3),
      ),
    );
  }
}
