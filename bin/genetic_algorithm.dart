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
    populationSizeWithoutElite =
        population.getPopulationAmount() - eliteStrategy.eliteStrategyAmount;
    runAlgorithm();
  }

  void runAlgorithm() {
    for (var i = 1; i <= epochsAmount; i++) {
      gradeStrategy.evaluate(population);
      print('**************Poczatek epoki $i**************');
      print(population.chromosomes);
      print(population.getPopulationAmount());
      print(' ');

      population = eliteStrategy.getBestFromPopulation(population);
      print('Po Elite: ');
      print(population.chromosomes);
      print(population.getPopulationAmount());
      print(' ');

      population = selection.selection(population);
      print('Po selekcji');
      print(population.chromosomes);
      print(population.getPopulationAmount());
      print(' ');

      population = cross.cross(population, populationSizeWithoutElite);
      gradeStrategy.evaluate(population);
      print('Po cross');
      print(population.chromosomes);
      print(population.getPopulationAmount());
      print(' ');

      mutation.mutation(population);
      gradeStrategy.evaluate(population);
      print('Po mutacji');
      print(population.chromosomes);
      print(population.getPopulationAmount());
      print(' ');

      inversion.inversion(population);
      gradeStrategy.evaluate(population);
      print('Po inwersji');
      print(population.chromosomes);
      print(population.getPopulationAmount());
      print(' ');

      eliteStrategy.setBestToPopulation(population);
      print('Dodanie najlepszych');
      print(population.chromosomes);
      print(population.getPopulationAmount());
      print(' ');
      print(' ');
    }
    gradeStrategy.evaluate(population);
    print('**********OSTATECZNA POPULACJA*******');
    print(population.chromosomes);
    print(population.getPopulationAmount());
    print(' ');
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
