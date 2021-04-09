class Result {
  int epochsAmount;
  int populationSize;
  String algorithmTime;
  List<double> bestInEpoch = [];
  List<double> averageInEpoch = [];
  List<double> standardDeviation = [];

  Result(
      {this.epochsAmount,
      this.populationSize,
      this.algorithmTime,
      this.bestInEpoch,
      this.averageInEpoch,
      this.standardDeviation});
}
