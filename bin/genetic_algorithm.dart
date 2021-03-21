import 'cross.dart';
import 'elite_strategy.dart';
import 'inversion.dart';
import 'mutation.dart';
import 'population.dart';
import 'selection.dart';

class GeneticAlgorithm {
  int epochsAmount;
  Inversion inversion;
  EliteStrategy eliteStrategy;
  Selection selection;
  Cross cross;
  Mutation mutation;
  Population population;

  GeneticAlgorithm(this.epochsAmount, this.inversion, this.eliteStrategy,
      this.selection, this.cross, this.mutation, this.population) {
    runAlgorithm();
  }

  void runAlgorithm() {
    for (var i = 1; i <= epochsAmount; i++) {
      population.evaluate();
      eliteStrategy.eliteStrategy(population);
      selection.selection(population);
      cross.cross(population);
      mutation.mutation(population);
      inversion.inversion(population);
    }
  }
}
