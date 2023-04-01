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
        padding: EdgeInsets.symmetric(vertical: 64, horizontal: 0),
        child: VStack(mainAxisAlignment: MainAxisAlignment.end, children: [
          VStack(
            spacing: Insets.xxl,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthInfo(
                label: "Welcome to\nEasy Finance".tr,
                subLabel: "Sign in to your easy finance account".tr,
              ),
              LoginForm(),
              TranslateButtons()
            ],
          )
        ]));
  }
}
