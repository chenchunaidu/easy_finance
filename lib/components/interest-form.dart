import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_finance/components/common/vstack.dart';
import 'package:easy_finance/components/interest-model.dart';
import 'package:easy_finance/components/interest-preview.dart';
import 'package:easy_finance/theme/color.dart';
import 'package:easy_finance/theme/inset.dart';

import '../theme/font.dart';
import 'common/form/custom-form-field.dart';
import 'common/form/index.dart';

var calendarForm = [
  {
    "type": FormFieldType.date,
    "name": "startDate",
    "placeholder": "startDatePlaceholder".tr,
  },
  {
    "type": FormFieldType.date,
    "name": "endDate",
    "placeholder": "endDatePlaceholder".tr,
  },
  {
    "type": FormFieldType.row,
    "fields": [
      {
        "type": FormFieldType.text,
        "name": "principleAmount",
        "placeholder": "Principle Amount".tr,
        "helperText": "principleHelperText".tr,
        "keyboardType": TextInputType.number
      },
      {
        "type": FormFieldType.text,
        "name": "interestRate",
        "placeholder": "Annual Interest Rate".tr,
        "helperText": "annualInterestRateHelperText".tr,
        "keyboardType": TextInputType.number
      },
    ]
  },
];

class InterestForm extends StatefulWidget {
  const InterestForm({Key? key}) : super(key: key);

  @override
  _InterestFormState createState() => _InterestFormState();
}

class _InterestFormState extends State<InterestForm> {
  InterestModel? interestData;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(Insets.lg),
        child: VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Insets.xl,
            children: [
              Text(
                'homeScreenHeading'.tr,
                style: TextStyles.h3,
              ),
              CustomForm(
                fields: calendarForm,
                spacing: Insets.lg,
                submitButtonChild: Text(
                  "interestCalculateButtonLabel".tr,
                  style: TextStyles.buttonText1,
                ),
                onSubmit: (value) {
                  setState(() {
                    interestData = InterestModel.fromJson(value);
                  });
                },
              ),
              interestData != null
                  ? VStack(children: [
                      InterestPreview(
                        label: "Simple".tr,
                        interestPreviewData:
                            interestData!.getSimpleInterestPreview(),
                      ),
                      InterestPreview(
                        label: "Compound".tr,
                        interestPreviewData:
                            interestData!.getCompoundInterestPreview(),
                      )
                    ])
                  : Container()
            ]));
  }
}
