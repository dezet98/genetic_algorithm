import 'dart:math';

import 'chromosome.dart';
import 'population.dart';

abstract class Mutation {
  Population mutation(Population population);
}

class OnePointMutation implements Mutation {
  var mutationProbability;
  var rnd = Random();

  OnePointMutation(this.mutationProbability);

  @override
  Population mutation(Population population) {
    for (var i = 0; i < population.getPopulationAmount(); i++) {
      for (var k = 0; k < 2; k++) {
        var mutationChance = rnd.nextDouble();
        if (mutationChance <= mutationProbability) {
          var mutationPoint =
              (rnd.nextDouble() * population.getChromosomeSize()).toInt();

          var chromosomes = population.getChromosomes();
          var listGene = chromosomes.elementAt(i).getProperGenes(k);

          var setBit;
          if (listGene[mutationPoint] == 1) {
            setBit = 0;
          } else {
            setBit = 1;
          }

          if (listGene[mutationPoint] == 0) {
            setBit = 1;
          } else {
            setBit = 0;
          }

          listGene[mutationPoint] = setBit;
          population.setChromosomes(chromosomes);
        }
      }
    }
    return population;
  }
}

class TwoPointsMutation implements Mutation {
  var mutationProbability;

  TwoPointsMutation(this.mutationProbability);

  @override
  Population mutation(Population population) {
    // TODO: implement mutation
    return population;
  }
}

class EdgeMutation implements Mutation {
  var mutationProbability;

  EdgeMutation(this.mutationProbability);

  @override
  Population mutation(Population population) {
    // TODO: implement mutation
    return population;
  }
}
