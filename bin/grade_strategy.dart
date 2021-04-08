import 'dart:math';

import 'population.dart';

abstract class GradeStrategy {
  void evaluate(Population population);
}

class MaximalGrade implements GradeStrategy {
  @override
  void evaluate(Population population) {
    for (var i = 0; i < population.getPopulationAmount(); i++) {
      population.getChromosomes()[i].setGrade(
          pow(population.decimalFirstNumber(i), 2) +
              pow(population.decimalSecondNumber(i), 2));
    }
    print(population.getChromosomes());
  }
}

class MinimalGrade implements GradeStrategy {
  @override
  void evaluate(Population population) {
    for (var i = 0; i < population.getPopulationAmount(); i++) {
      population.getChromosomes()[i].setGrade(1 /
          (pow(population.decimalFirstNumber(i), 2) +
              pow(population.decimalSecondNumber(i), 2)));
    }
  }
}
