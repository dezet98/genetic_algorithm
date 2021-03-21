import 'population.dart';

abstract class Cross {
  Population cross(population);
}

class OnePointCross implements Cross {
  var crossProbability;
  var maximization;

  OnePointCross(this.crossProbability, this.maximization);

  @override
  Population cross(population) {
    // TODO: implement select
    return population;
  }
}

class TwoPointsCross implements Cross {
  var crossProbability;
  var maximization;

  TwoPointsCross(this.crossProbability, this.maximization);

  @override
  Population cross(population) {
    // TODO: implement select
    return population;
  }
}

class ThreePointsCross implements Cross {
  var crossProbability;
  var maximization;

  ThreePointsCross(this.crossProbability, this.maximization);

  @override
  Population cross(population) {
    // TODO: implement select
    return population;
  }
}
