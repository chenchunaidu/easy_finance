class InterestPreviewModel {
  final String principleAmount;
  final String timePeriod;
  final String interestRate;
  final String totalAmount;

  InterestPreviewModel(
      {required this.timePeriod,
      required this.totalAmount,
      required this.principleAmount,
      required this.interestRate});
}
