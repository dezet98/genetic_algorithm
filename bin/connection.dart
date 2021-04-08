import 'genetic_algorithm_create.dart';

class Connection {
  Connection();

  void connect() {
    GeneticAlgorithmCreate(
      startRange: -10,
      endRange: 10,
      populationAmount: 15,
      epochsAmount: 10,
      selectionProbability: 0.2,
      crossProbability: 0.2,
      mutationProbability: 0.2,
      inversionProbability: 0.2,
      eliteStrategyAmount: 4,
      gradeStrategy: 'maximal_grade',
      selection: 'roulette',
      cross: 'one_point_cross',
      mutation: 'one_point_mutation',
    );
  }
}
