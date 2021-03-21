import 'cross.dart';
import 'elite_strategy.dart';
import 'genetic_algorithm.dart';
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

  static const ONE_POINT_MUTATION = 'one_point_mutation';
  static const TWO_POINTS_MUTATION = 'two_points_mutation';
  static const EDGE_MUTATION = 'edge_mutation';

  double startRange;
  double endRange;
  int chromosomeAccuracy;
  int populationAmount;
  int epochsAmount;
  double crossProbability;
  double mutationProbability;
  double inversionProbability;
  int eliteStrategyAmount;
  bool maximization;
  String selection;
  String cross;
  String mutation;

  GeneticAlgorithmCreate(
      this.startRange,
      this.endRange,
      this.chromosomeAccuracy,
      this.populationAmount,
      this.epochsAmount,
      this.crossProbability, // prawdopodobieństwo krzyżowania to 80-90%
      this.mutationProbability, // prawdopodobieństwo mutacji to około 20%
      this.inversionProbability,
      this.eliteStrategyAmount,
      // strategia elitarna podczas oceny wybierz najlepszego lub % najlepszych i dodaj ich do nowej populacji od razu
      this.maximization,
      this.selection,
      this.cross,
      this.mutation) {
    createGeneticAlgorithm();
  }

  Selection chooseSelection(selection) {
    Selection selectionChoose;
    switch (selection) {
      case BEST:
        selectionChoose = Best(maximization);
        break;

      case ROULETTE:
        selectionChoose = Roulette(maximization);
        break;

      case TOURNAMENT:
        selectionChoose = Tournament(maximization);
        break;
    }
    ;

    return selectionChoose;
  }

  Cross crossChoose(cross) {
    Cross crossChoose;
    switch (cross) {
      case ONE_POINT_CROSS:
        crossChoose = OnePointCross(crossProbability, maximization);
        break;

      case TWO_POINTS_CROSS:
        crossChoose = TwoPointsCross(crossProbability, maximization);
        break;

      case THREE_POINTS_CROSS:
        crossChoose = ThreePointsCross(crossProbability, maximization);
        break;
    }
    ;

    return crossChoose;
  }

  Mutation mutationChoose(mutation) {
    Mutation mutationChoose;
    switch (mutation) {
      case ONE_POINT_MUTATION:
        mutationChoose = OnePointMutation(mutationProbability, maximization);
        break;

      case TWO_POINTS_MUTATION:
        mutationChoose = TwoPointsMutation(mutationProbability, maximization);
        break;

      case EDGE_MUTATION:
        mutationChoose = EdgeMutation(mutationProbability, maximization);
        break;
    }
    ;

    return mutationChoose;
  }

  void createGeneticAlgorithm() {
    var inversion = Inversion(inversionProbability, maximization);
    var eliteStrategy = EliteStrategy(eliteStrategyAmount, maximization);
    var selection = chooseSelection('best');
    var cross = crossChoose('one_point_cross');
    var mutation = mutationChoose('one_point_mutation');
    var population = Population(startRange, endRange, populationAmount);

    GeneticAlgorithm(epochsAmount, inversion, eliteStrategy, selection, cross,
        mutation, population);
  }
}
