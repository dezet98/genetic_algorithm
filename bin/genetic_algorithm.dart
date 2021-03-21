import 'population.dart';

enum CrossMethods { one_point, two_points, three_points, homo }

enum MutationMethods { one_point }

class GeneticAlgorithm {
  double startRange;
  double endRange;
  int populationAmount;
  int bitsNumber;
  int epochsAmount;
  double crossProbability;
  double mutationProbability;
  double inversionProbability;
  int eliteStrategyAmount;
  bool maximization;
  Population population;

  //selection args for best and tournament
  int chromosomeAmount;

  GeneticAlgorithm(this.population);

  void run() {
    print('run...');
  }
}
