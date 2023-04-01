import 'package:flutter/material.dart';
import 'common/hstack.dart';

class InterestPreviewLineItem extends StatelessWidget {
  const InterestPreviewLineItem(
      {Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return HStack(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
