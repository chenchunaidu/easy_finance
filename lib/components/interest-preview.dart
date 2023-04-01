import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_finance/components/common/vstack.dart';
import 'package:easy_finance/components/interest-preview-line-item.dart';
import 'package:easy_finance/components/interest-preview-model.dart';
import 'package:easy_finance/theme/color.dart';
import 'package:easy_finance/theme/inset.dart';

class InterestPreview extends StatelessWidget {
  const InterestPreview(
      {Key? key, required this.label, required this.interestPreviewData})
      : super(key: key);
  final InterestPreviewModel interestPreviewData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Insets.md),
        color: Colors.grey.shade900,
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(Insets.xl),
      child: VStack(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 16, color: brand),
        ),
        InterestPreviewLineItem(
            label: "Principle Amount".tr,
            value: interestPreviewData.principleAmount),
        InterestPreviewLineItem(
            label: "Annual Interest Rate".tr,
            value: "${interestPreviewData.interestRate}%"),
        InterestPreviewLineItem(
            label: "Time Period".tr, value: interestPreviewData.timePeriod),
        const Divider(),
        InterestPreviewLineItem(
            label: "Total Amount".tr, value: interestPreviewData.totalAmount),
      ]),
    );
  }
}
