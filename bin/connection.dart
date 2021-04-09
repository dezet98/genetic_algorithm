import 'cross.dart';
import 'genetic_algorithm_create.dart';
import 'grade_strategy.dart';
import 'mutation.dart';
import 'selection.dart';

class Connection {
  Connection();

  void connect() {
    GeneticAlgorithmCreate(
      startRange: -10,
      endRange: 10,
      populationAmount: 150,
      epochsAmount: 10,
      selectionProbability: 0.2,
      crossProbability: 0.2,
      mutationProbability: 0.2,
      inversionProbability: 0.2,
      eliteStrategyAmount: 4,
      gradeStrategy: GradeStrategy.MAXIMAL_GRADE,
      selection: Selection.ROULETTE,
      cross: Cross.ONE_POINT_CROSS,
      mutation: Mutation.ONE_POINT_MUTATION,
    );
  }
}
