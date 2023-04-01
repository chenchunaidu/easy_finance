import 'package:flutter/material.dart';
import 'package:easy_finance/components/common/vstack.dart';
import 'package:easy_finance/components/interest-form.dart';

import '../components/translate-buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: VStack(spacing: 0.0, children: [
      InterestForm(),
      TranslateButtons(),
    ]));
  }
}
