import 'dart:async';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/extras/app_assets.dart';
import 'package:whatsapp_clone/extras/colors.dart';
import 'package:whatsapp_clone/extras/extensions.dart';
import 'package:whatsapp_clone/screens/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.pushReplacement(child: const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image(
                  image: AssetImage(AppImages.logo),
                  width: 100,
                ),
              ),
              buildText("From"),
              buildText("FACEBOOK", color: CColors.primary),
            ],
          ),
        ),
      ),
    );
  }

  Text buildText(String str, {Color color = Colors.black}) {
    return Text(
      str,
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: color),
    );
  }
}
