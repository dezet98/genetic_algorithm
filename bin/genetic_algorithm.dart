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
  int populationSizeWithoutElite;

  GeneticAlgorithm(
      this.epochsAmount,
      this.inversion,
      this.eliteStrategy,
      this.selection,
      this.cross,
      this.mutation,
      this.gradeStrategy,
      this.population) {
    populationSizeWithoutElite = population.getPopulationAmount() - eliteStrategy.eliteStrategyAmount;
    runAlgorithm();
  }

  void runAlgorithm() {
    for (var i = 1; i <= epochsAmount; i++) {
      gradeStrategy.evaluate(population);
      // if(i == 1){
      //   print(population.chromosomes);
      //   print(population.getPopulationAmount());
      // }
      population = eliteStrategy.getBestFromPopulation(population);
      // if(i == 1){
      //   print(population.chromosomes);
      //   print(population.getPopulationAmount());
      // }
      population = selection.selection(population);
      // if(i == 1){
      //   print(population.chromosomes);
      //   print(population.getPopulationAmount());
      // }
      population = cross.cross(population, populationSizeWithoutElite);
      // if(i == 1){
      //   print(population.chromosomes);
      //   print(population.getPopulationAmount());
      // }
      mutation.mutation(population);
      inversion.inversion(population);
      eliteStrategy.setBestToPopulation(population);
      // if(i == 1){
      //   print(population.chromosomes);
      //   print(population.getPopulationAmount());
      // }
    }
    gradeStrategy.evaluate(population);
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
