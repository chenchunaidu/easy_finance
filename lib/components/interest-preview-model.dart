class InterestPreviewModel {
  final String principleAmount;
  final String timePeriod;
  final String interestRate;
  final String totalAmount;
  final String startDate;
  final String endDate;

  InterestPreviewModel(
      {required this.timePeriod,
      required this.totalAmount,
      required this.principleAmount,
      required this.interestRate,
      required this.startDate,
      required this.endDate});
}
