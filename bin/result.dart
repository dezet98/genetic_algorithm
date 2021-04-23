class Result {
  late int epochsAmount;
  late int populationSize;
  late String algorithmTime;
  late double best;
  late DateTime dataTime;
  late double bestAverage;
  late List<double> bestInEpoch = [];
  late List<double> averageInEpoch = [];
  late List<double> standardDeviation = [];
  late List<List<double>> chromosomesInEachEpoch = [];

  Result({
    required this.epochsAmount,
    required this.populationSize,
    required this.algorithmTime,
    required this.best,
    required this.dataTime,
    required this.bestAverage,
    required this.bestInEpoch,
    required this.averageInEpoch,
    required this.standardDeviation,
    required this.chromosomesInEachEpoch,
  });
}
