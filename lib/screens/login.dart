import 'package:flutter/material.dart';
import 'package:easy_finance/components/auth-info.dart';
import 'package:easy_finance/components/login-form.dart';
import 'package:easy_finance/components/common/vstack.dart';
import 'package:easy_finance/components/translate/translate-buttons.dart';
import 'package:easy_finance/theme/inset.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
            VStack(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      VStack(
        spacing: Insets.xxl,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthInfo(
            label: "Welcome to\nFlutter boilerplate".tr,
            subLabel: "Sign in to Flutter boilerplate to check all features".tr,
          ),
          LoginForm(),
          TranslateButtons()
        ],
      )
    ]));
  }
}
