import 'population.dart';

abstract class Cross {
  Population cross(population);
}

class OnePointCross implements Cross {
  var crossProbability;

  OnePointCross(this.crossProbability);

  @override
  Population cross(population) {
    // TODO: implement select
    return population;
  }
}

class TwoPointsCross implements Cross {
  var crossProbability;

  TwoPointsCross(this.crossProbability);

  @override
  Population cross(population) {
    // TODO: implement select
    // Population newPopulation = Population(population);

    return population;
  }
}

class ThreePointsCross implements Cross {
  var crossProbability;

  ThreePointsCross(this.crossProbability);

  @override
  Population cross(population) {
    // TODO: implement select
    return population;
  }
}
