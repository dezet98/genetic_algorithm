import 'population.dart';

abstract class Selection {
  Population selection(population);
}

class Best implements Selection {
  Best();

  @override
  Population selection(population) {
    // TODO: implement select
    return population;
  }
}

class Roulette implements Selection {
  Roulette();

  @override
  Population selection(population) {
    // TODO: implement select
    return population;
  }
}

class Tournament implements Selection {
  Tournament();

  @override
  Population selection(population) {
    // TODO: implement select
    return population;
  }
}
