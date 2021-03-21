import 'population.dart';

abstract class Selection {
  Population selection(population);
}

class Best implements Selection {
  var maximization;

  Best(this.maximization);

  @override
  Population selection(population) {
    // TODO: implement select
    return population;
  }
}

class Roulette implements Selection {
  var maximization;

  Roulette(this.maximization);

  @override
  Population selection(population) {
    // TODO: implement select
    return population;
  }
}

class Tournament implements Selection {
  var maximization;

  Tournament(this.maximization);

  @override
  Population selection(population) {
    // TODO: implement select
    return population;
  }
}
