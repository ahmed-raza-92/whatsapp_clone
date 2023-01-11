import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/extras/colors.dart';
import 'package:whatsapp_clone/extras/extensions.dart';
import 'package:whatsapp_clone/screens/auth/otp_verification.dart';
import 'package:whatsapp_clone/widgets/margin_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late double height;
  TextEditingController number = TextEditingController();
  String country = "Pakistan";
  String code = "92";

  @override
  Widget build(BuildContext context) {
    height = context.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.018, right: 15),
            child: InkWell(
              onTap: () {
                if (number.text.isNotEmpty) {
                  context.push(child: const OTPVerification());
                }
              },
              child: Text(
                "Done",
                style: TextStyle(
                  color: number.text.isEmpty ? CColors.lightGrey : Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: const Color(0xffF6F6F6),
        elevation: 0,
        title: const Text(
          "Phone Number",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const MarginWidget(),
            const Text(
              "Please confirm your country code and \nenter your phone number ",
              textAlign: TextAlign.center,
            ),
            const MarginWidget(),
            buildDivider(),
            InkWell(
              onTap: () {
                showCountryPicker(
                    context: context,
                    onSelect: (country) {


                      setState(() {
                        this.country = country.name;
                        code = country.phoneCode;
                      });
                    });
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      country,
                      style: TextStyle(color: CColors.primary, fontSize: 17),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black.withOpacity(0.3),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            buildDivider(),
            numberInput(),
            buildDivider(),
          ],
        ),
      ),
    );
  }

  Widget numberInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "+$code",
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              color: Colors.grey.withOpacity(
                0.5,
              ),
              width: 1,
              height: double.infinity,
            ),
            const MarginWidget(
              isHorizontal: true,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  controller: number,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(fontSize: 20),
                    hintText: "Phone number",
                    hintStyle: TextStyle(fontSize: 20),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  onSubmitted: (value) {
                    setState(() {});
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      color: Colors.black.withOpacity(0.5),
    );
  }
}
