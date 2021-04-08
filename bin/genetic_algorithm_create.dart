import 'cross.dart';
import 'elite_strategy.dart';
import 'genetic_algorithm.dart';
import 'grade_strategy.dart';
import 'inversion.dart';
import 'mutation.dart';
import 'population.dart';
import 'selection.dart';

class GeneticAlgorithmCreate {
  static const BEST = 'best';
  static const ROULETTE = 'roulette';
  static const TOURNAMENT = 'tournament';

  static const ONE_POINT_CROSS = 'one_point_cross';
  static const TWO_POINTS_CROSS = 'two_points_cross';
  static const THREE_POINTS_CROSS = 'three_points_cross';
  static const HOMOGENEOUS_CROSS = 'homogeneous_cross';

  static const ONE_POINT_MUTATION = 'one_point_mutation';
  static const TWO_POINTS_MUTATION = 'two_points_mutation';
  static const EDGE_MUTATION = 'edge_mutation';

  static const MAXIMAL_GRADE = 'maximal_grade';
  static const MINIMAL_GRADE = 'minimal_grade';

  double startRange;
  double endRange;
  int populationAmount;
  int epochsAmount;
  double selectionProbability;
  double crossProbability;
  double mutationProbability;
  double inversionProbability;
  int eliteStrategyAmount;
  String gradeStrategy;
  String selection;
  String cross;
  String mutation;

  GeneticAlgorithmCreate(
      this.startRange,
      this.endRange,
      this.populationAmount,
      this.epochsAmount,
      this.selectionProbability,
      this.crossProbability, // prawdopodobieństwo krzyżowania to 80-90%
      this.mutationProbability, // prawdopodobieństwo mutacji to około 20%
      this.inversionProbability,
      this.eliteStrategyAmount,
      // strategia elitarna podczas oceny wybierz najlepszego lub % najlepszych i dodaj ich do nowej populacji od razu
      this.gradeStrategy,
      this.selection,
      this.cross,
      this.mutation) {
    createGeneticAlgorithm();
  }

  Selection chooseSelection(selection) {
    Selection selectionChoose;
    switch (selection) {
      case BEST:
        selectionChoose = Best(selectionProbability);
        break;

      case ROULETTE:
        selectionChoose = Roulette();
        break;

      case TOURNAMENT:
        selectionChoose = Tournament();
        break;
    };

    return selectionChoose;
  }

  Cross crossChoose(cross) {
    Cross crossChoose;
    switch (cross) {
      case ONE_POINT_CROSS:
        crossChoose = OnePointCross(crossProbability);
        break;

      case TWO_POINTS_CROSS:
        crossChoose = TwoPointsCross(crossProbability);
        break;

      case THREE_POINTS_CROSS:
        crossChoose = ThreePointsCross(crossProbability);
        break;

      case HOMOGENEOUS_CROSS:
        crossChoose = HomogeneousCross(crossProbability);
        break;
    }
    ;

    return crossChoose;
  }

  Mutation mutationChoose(mutation) {
    Mutation mutationChoose;
    switch (mutation) {
      case ONE_POINT_MUTATION:
        mutationChoose = OnePointMutation(mutationProbability);
        break;

      case TWO_POINTS_MUTATION:
        mutationChoose = TwoPointsMutation(mutationProbability);
        break;

      case EDGE_MUTATION:
        mutationChoose = EdgeMutation(mutationProbability);
        break;
    }
    ;

    return mutationChoose;
  }

  GradeStrategy gradeStrategyChoose(gradeStrategy) {
    GradeStrategy gradeStrategyChoose;
    switch (gradeStrategy) {
      case MAXIMAL_GRADE:
        gradeStrategyChoose = MaximalGrade();
        break;

      case MINIMAL_GRADE:
        gradeStrategyChoose = MinimalGrade();
        break;
    }
    ;

    return gradeStrategyChoose;
  }

  void createGeneticAlgorithm() {
    var inversion = Inversion(inversionProbability);
    var eliteStrategy = EliteStrategy(eliteStrategyAmount);
    var selection = chooseSelection(this.selection);
    var cross = crossChoose(this.cross);
    var mutation = mutationChoose(this.mutation);
    var gradeStrategy = gradeStrategyChoose(this.gradeStrategy);
    var population = Population(startRange, endRange, populationAmount);

    GeneticAlgorithm(epochsAmount, inversion, eliteStrategy, selection, cross,
        mutation, gradeStrategy, population);
  }
}
