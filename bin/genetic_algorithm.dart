import 'cross.dart';
import 'elite_strategy.dart';
import 'grade_strategy.dart';
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
  GradeStrategy gradeStrategy;
  Population population;

  GeneticAlgorithm(
      this.epochsAmount,
      this.inversion,
      this.eliteStrategy,
      this.selection,
      this.cross,
      this.mutation,
      this.gradeStrategy,
      this.population) {
    runAlgorithm();
  }

  void runAlgorithm() {
    for (var i = 1; i <= epochsAmount; i++) {
      gradeStrategy.evaluate(population);
      population = eliteStrategy.getBestFromPopulation(population); // zrobione
      population = selection.selection(population);
      population = cross.cross(population);
      mutation.mutation(population);
      inversion.inversion(population);
      population = eliteStrategy.setBestToPopulation(population); // zrobione
    }
    findTheBest(population);
  }

  void findTheBest(Population population) {
    var bestChromosome = population.getChromosomes().reduce(
        (curr, next) => curr.getGrade() > next.getGrade() ? curr : next);

    var bestChromosomeGrade;
    if (gradeStrategy is MinimalGrade) {
      bestChromosomeGrade = 1 / bestChromosome.getGrade();
    } else {
      bestChromosomeGrade = bestChromosome.getGrade();
    }

    print('A zwycięzcą jest:');
    print(bestChromosomeGrade);
  }
}
