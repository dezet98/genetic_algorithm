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
      int firstParent;
      int secondParent;
      do{
        firstParent = (rnd.nextDouble() * (newPopulation.getPopulationAmount())).toInt();
        secondParent = (rnd.nextDouble() * (newPopulation.getPopulationAmount())).toInt();
      }while(firstParent == secondParent);

      // print(firstParent);
      // print(secondParent);
      var crossingChance = rnd.nextDouble();
      if (crossingChance <= crossProbability) {
        var firstNewChromosome = <List<int>>[];
        var secondNewChromosome = <List<int>>[];

        for (var k = 1; k <= 2; k++) {
          int crossingPoint1;
          int crossingPoint2;
          do {
            crossingPoint1 =
                (rnd.nextDouble() * (newPopulation.getChromosomeSize())).toInt();
            crossingPoint2 =
                (rnd.nextDouble() * (newPopulation.getChromosomeSize())).toInt();
          } while (crossingPoint1 == crossingPoint2);

          int firstPoint;
          int secondPoint;
          if (crossingPoint1 > crossingPoint2) {
            firstPoint = crossingPoint2;
            secondPoint = crossingPoint1;
          } else {
            firstPoint = crossingPoint1;
            secondPoint = crossingPoint2;
          }

          var firstPart1 = (newPopulation
                  .getChromosomes()
                  .elementAt(firstParent)
                  .getProperGenes(k)
                  .getRange(0, firstPoint + 1))
              .toList();
          var secondPart1 = (newPopulation
                  .getChromosomes()
                  .elementAt(secondParent)
                  .getProperGenes(k)
                  .getRange(firstPoint + 1, secondPoint + 1))
              .toList();
          var thirdPart1 = (newPopulation
                  .getChromosomes()
                  .elementAt(firstParent)
                  .getProperGenes(k)
                  .getRange(secondPoint + 1, population.getChromosomeSize()))
              .toList();

          var firstPart2 = newPopulation
              .getChromosomes()
              .elementAt(secondParent)
              .getProperGenes(k)
              .getRange(0, firstPoint + 1);
          var secondPart2 = newPopulation
              .getChromosomes()
              .elementAt(firstParent)
              .getProperGenes(k)
              .getRange(firstPoint + 1, secondPoint + 1);
          var thirdPart2 = newPopulation
              .getChromosomes()
              .elementAt(secondParent)
              .getProperGenes(k)
              .getRange(secondPoint + 1, newPopulation.getChromosomeSize());

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
    if(newPopulation.getChromosomes().length != populationSizeWithoutElite){
      newPopulation.getChromosomes().removeLast();
      newPopulation.setPopulationAmount(newPopulation.getPopulationAmount()-1);
    }
    return newPopulation;
  }
}

class ThreePointsCross implements Cross {
  var crossProbability;

  ThreePointsCross(this.crossProbability);

  @override
  Population cross(Population population, int populationSizeWithoutElite) {
    // TODO: implement select
    return population;
  }
}
