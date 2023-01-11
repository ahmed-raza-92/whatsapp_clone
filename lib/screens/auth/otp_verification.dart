import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:whatsapp_clone/extras/colors.dart';
import 'package:whatsapp_clone/extras/extensions.dart';
import 'package:whatsapp_clone/screens/home_page.dart';
import 'package:whatsapp_clone/widgets/margin_widget.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  late double width, padding;
  int seconds = 59;

  late Timer _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (seconds == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            seconds--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    width = context.width;
    padding = width * 0.03;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              headerRow(),
              const MarginWidget(
                factor: 12,
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Code has been send to +92302*****278"),
                    const MarginWidget(
                      factor: 2.0,
                    ),
                    Pinput(
                      length: 6,
                      submittedPinTheme: buildPinTheme(color: CColors.primary),
                      separator: const MarginWidget(
                        isHorizontal: true,
                      ),
                      defaultPinTheme: buildPinTheme(),
                    ),
                    const MarginWidget(
                      factor: 2.0,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Resend Code in",
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: " $seconds ",
                              style: TextStyle(color: CColors.primary),
                            ),
                            const TextSpan(text: "s")
                          ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CColors.primary,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            insetPadding:
                            const EdgeInsets.symmetric(horizontal: 160),
                            content: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircularProgressIndicator(
                                color: CColors.primary,
                              ),
                            ),
                          );
                        });
                    Timer(const Duration(seconds: 2), () {
                      context.pop();
                      context.push(child: const HomePage());
                    });

                  },
                  child: const Text("Verify"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PinTheme buildPinTheme({Color? color}) {
    color ??= Colors.black.withOpacity(0.2);
    return PinTheme(
      width: 70,
      height: 70,
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget headerRow() {
    return Row(
      children: [
        InkWell(
            onTap: () {
              context.pop();
            },
            child: const Icon(Icons.arrow_back, size: 20)),
        const MarginWidget(isHorizontal: true, factor: 2),
        const Text(
          "Enter OTP Code",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
