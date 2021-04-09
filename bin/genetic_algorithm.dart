import 'dart:math';

import 'cross.dart';
import 'elite_strategy.dart';
import 'grade_strategy.dart';
import 'inversion.dart';
import 'mutation.dart';
import 'population.dart';
import 'result.dart';
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
  List<double> bestInEpoch = [];
  List<double> averageInEpoch = [];
  List<double> standardDeviation = [];

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
  }

  Result runAlgorithm() {
    final stopwatch = Stopwatch()..start();
    for (var i = 1; i <= epochsAmount; i++) {
      gradeStrategy.evaluate(population);
      bestInEpoch.add(findTheBest(population));
      averageInEpoch.add(calculateAverage(population));
      standardDeviation.add(calculateStandardDeviation(population));

      printPopulation('**************Poczatek epoki $i**************');

      population = eliteStrategy.getBestFromPopulation(population);
      printPopulation('Po Elite: ');

      population = selection.selection(population);
      printPopulation('Po selekcji');

      population = cross.cross(population, populationSizeWithoutElite);
      gradeStrategy.evaluate(population);
      printPopulation('Po cross');

      mutation.mutation(population);
      gradeStrategy.evaluate(population);
      printPopulation('Po mutacji');


      inversion.inversion(population);
      gradeStrategy.evaluate(population);
      printPopulation('Po inwersji');


      eliteStrategy.setBestToPopulation(population);
      printPopulation('Dodanie najlepszych');
    }
    gradeStrategy.evaluate(population);
    bestInEpoch.add(findTheBest(population));
    averageInEpoch.add(calculateAverage(population));
    standardDeviation.add(calculateStandardDeviation(population));
    printPopulation('**********OSTATECZNA POPULACJA*******');

    var result = Result(
        epochsAmount: epochsAmount,
        populationSize: population.getPopulationAmount(),
        algorithmTime: (stopwatch.elapsed.inMilliseconds / 1000).toString(),
        bestInEpoch: bestInEpoch,
        averageInEpoch: averageInEpoch,
        standardDeviation: standardDeviation);

    return result;
  }

  void printPopulation(String text){
    print(text);
    if(gradeStrategy is MinimalGrade){
      print(population.chromosomes.map((e) => 1/e.getGrade()).toList());
    }
    else{
      print(population.chromosomes);
    }
    print(population.getPopulationAmount());
    print(' ');
  }


  double findTheBest(Population population) {
    var bestChromosome = population.getChromosomes().reduce(
        (curr, next) => curr.getGrade() > next.getGrade() ? curr : next);

    var bestChromosomeGrade;
    if (gradeStrategy is MinimalGrade) {
      bestChromosomeGrade = 1 / bestChromosome.getGrade();
    } else {
      bestChromosomeGrade = bestChromosome.getGrade();
    }

    return bestChromosomeGrade;
  }

  double calculateAverage(Population population) {
    var sum = 0.0;
    if (gradeStrategy is MinimalGrade) {
      sum = population
          .getChromosomes()
          .map((x) => 1/x.getGrade())
          .fold(0, (a, b) => a + b);
    } else {
      sum = population
          .getChromosomes()
          .map((x) => x.getGrade())
          .fold(0, (a, b) => a + b);
    }

    return sum / population.getPopulationAmount();
  }

  double calculateStandardDeviation(Population population) {
    var average = 0.0;
    var sum = 0.0;
    if (gradeStrategy is MinimalGrade) {
      average = (population
              .getChromosomes()
              .map((x) => 1 / x.getGrade())
              .fold(0, (a, b) => a + b)) /
          population.getPopulationAmount();

      for (var i = 0; i < population.getPopulationAmount(); i++) {
        sum += pow((1/population.getChromosomes()[i].getGrade() - average), 2);
      }
    } else {
      average = (population
              .getChromosomes()
              .map((x) => x.getGrade())
              .fold(0, (a, b) => a + b)) /
          population.getPopulationAmount();

      for (var i = 0; i < population.getPopulationAmount(); i++) {
        sum += pow((population.getChromosomes()[i].getGrade() - average), 2);
      }
    }

    return sqrt(sum / average);
  }
}
