import 'dart:collection';
import 'dart:math';

import 'chromosome.dart';
import 'population.dart';

abstract class Cross {
  Population cross(Population population, int populationSizeWithoutElite);
}

class OnePointCross implements Cross {
  var crossProbability;

  OnePointCross(this.crossProbability);

  @override
  Population cross(Population population, int populationSizeWithoutElite) {
    // TODO: implement cross
    return population;
  }
}

class TwoPointsCross implements Cross {
  var crossProbability;
  var rnd = Random();

  TwoPointsCross(this.crossProbability);

  @override
  Population cross(Population population, int populationSizeWithoutElite) {
    var newPopulation = Population.fromPopulation(
        population.startRange,
        population.endRange,
        population.getPopulationAmount(),
        population.chromosomeSize,
        population.getChromosomes());

    while (newPopulation.getPopulationAmount() < populationSizeWithoutElite) {
      var parents = <int>{};
      do {
        parents.add(
            (rnd.nextDouble() * (newPopulation.getPopulationAmount())).toInt());
      } while (parents.length != 2);

      var crossingChance = rnd.nextDouble();
      if (crossingChance <= crossProbability) {
        var firstNewChromosome = <List<int>>[];
        var secondNewChromosome = <List<int>>[];

        for (var k = 1; k <= 2; k++) {
          var crossPoints = SplayTreeSet();
          do {
            crossPoints.add(
                (rnd.nextDouble() * (newPopulation.getChromosomeSize()))
                    .toInt());
          } while (crossPoints.length != 2);

          var firstPart1 = (newPopulation
                  .getChromosomes()
                  .elementAt(parents.first)
                  .getProperGenes(k)
                  .getRange(0, crossPoints.first + 1))
              .toList();
          var secondPart1 = (newPopulation
                  .getChromosomes()
                  .elementAt(parents.last)
                  .getProperGenes(k)
                  .getRange(crossPoints.first + 1, crossPoints.last + 1))
              .toList();
          var thirdPart1 = (newPopulation
                  .getChromosomes()
                  .elementAt(parents.first)
                  .getProperGenes(k)
                  .getRange(
                      crossPoints.last + 1, population.getChromosomeSize()))
              .toList();

          var firstPart2 = newPopulation
              .getChromosomes()
              .elementAt(parents.last)
              .getProperGenes(k)
              .getRange(0, crossPoints.first + 1);
          var secondPart2 = newPopulation
              .getChromosomes()
              .elementAt(parents.first)
              .getProperGenes(k)
              .getRange(crossPoints.first + 1, crossPoints.last + 1);
          var thirdPart2 = newPopulation
              .getChromosomes()
              .elementAt(parents.last)
              .getProperGenes(k)
              .getRange(
                  crossPoints.last + 1, newPopulation.getChromosomeSize());

          firstNewChromosome
              .add([...firstPart1, ...secondPart1, ...thirdPart1]);
          secondNewChromosome
              .add([...firstPart2, ...secondPart2, ...thirdPart2]);
        }
        newPopulation.addChromosome(
            Chromosome(firstNewChromosome[0], firstNewChromosome[1]));
        newPopulation.addChromosome(
            Chromosome(secondNewChromosome[0], secondNewChromosome[1]));
      }
    }
    if (newPopulation.getChromosomes().length != populationSizeWithoutElite) {
      newPopulation.getChromosomes().removeLast();
      newPopulation
          .setPopulationAmount(newPopulation.getPopulationAmount() - 1);
    }
    return newPopulation;
  }
}

class ThreePointsCross implements Cross {
  var crossProbability;
  var rnd = Random();

  ThreePointsCross(this.crossProbability);

  @override
  Population cross(Population population, int populationSizeWithoutElite) {
    var newPopulation = Population.fromPopulation(
        population.startRange,
        population.endRange,
        population.getPopulationAmount(),
        population.chromosomeSize,
        population.getChromosomes());

    while (newPopulation.getPopulationAmount() < populationSizeWithoutElite) {
      var parents = <int>{};
      do {
        parents.add(
            (rnd.nextDouble() * (newPopulation.getPopulationAmount())).toInt());
      } while (parents.length != 2);

      var crossingChance = rnd.nextDouble();
      if (crossingChance <= crossProbability) {
        var firstNewChromosome = <List<int>>[];
        var secondNewChromosome = <List<int>>[];

        for (var k = 1; k <= 2; k++) {
          var crossPoints = SplayTreeSet();
          do {
            crossPoints.add(
                (rnd.nextDouble() * (newPopulation.getChromosomeSize()))
                    .toInt());
          } while (crossPoints.length != 3);

          // print(crossPoints);
          // print(crossPoints.first);
          // print(crossPoints.elementAt(1));
          // print(crossPoints.last);

          var firstPart1 = (newPopulation
                  .getChromosomes()
                  .elementAt(parents.first)
                  .getProperGenes(k)
                  .getRange(0, crossPoints.first + 1))
              .toList();
          var secondPart1 = (newPopulation
                  .getChromosomes()
                  .elementAt(parents.last)
                  .getProperGenes(k)
                  .getRange(
                      crossPoints.first + 1, crossPoints.elementAt(1) + 1))
              .toList();
          var thirdPart1 = (newPopulation
                  .getChromosomes()
                  .elementAt(parents.first)
                  .getProperGenes(k)
                  .getRange(crossPoints.elementAt(1) + 1, crossPoints.last + 1))
              .toList();
          var fourthPart1 = (newPopulation
                  .getChromosomes()
                  .elementAt(parents.last)
                  .getProperGenes(k)
                  .getRange(
                      crossPoints.last + 1, population.getChromosomeSize()))
              .toList();

          var firstPart2 = (newPopulation
                  .getChromosomes()
                  .elementAt(parents.last)
                  .getProperGenes(k)
                  .getRange(0, crossPoints.first + 1))
              .toList();
          var secondPart2 = (newPopulation
                  .getChromosomes()
                  .elementAt(parents.first)
                  .getProperGenes(k)
                  .getRange(
                      crossPoints.first + 1, crossPoints.elementAt(1) + 1))
              .toList();
          var thirdPart2 = (newPopulation
                  .getChromosomes()
                  .elementAt(parents.last)
                  .getProperGenes(k)
                  .getRange(crossPoints.elementAt(1) + 1, crossPoints.last + 1))
              .toList();
          var fourthPart2 = (newPopulation
                  .getChromosomes()
                  .elementAt(parents.first)
                  .getProperGenes(k)
                  .getRange(
                      crossPoints.last + 1, population.getChromosomeSize()))
              .toList();

          firstNewChromosome.add(
              [...firstPart1, ...secondPart1, ...thirdPart1, ...fourthPart1]);
          secondNewChromosome.add(
              [...firstPart2, ...secondPart2, ...thirdPart2, ...fourthPart2]);
        }
        newPopulation.addChromosome(
            Chromosome(firstNewChromosome[0], firstNewChromosome[1]));
        newPopulation.addChromosome(
            Chromosome(secondNewChromosome[0], secondNewChromosome[1]));
      }
    }
    if (newPopulation.getChromosomes().length != populationSizeWithoutElite) {
      newPopulation.getChromosomes().removeLast();
      newPopulation
          .setPopulationAmount(newPopulation.getPopulationAmount() - 1);
    }
    return newPopulation;
  }
}
