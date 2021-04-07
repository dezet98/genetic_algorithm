import 'dart:core';
import 'dart:math';

import 'chromosome.dart';

class Population {
  static const CHROMOSOME_ACCURACY = 6;
  double startRange;
  double endRange;
  int populationAmount;
  int chromosomeSize;
  List<Chromosome> chromosomes = [];

  Population(this.startRange, this.endRange, this.populationAmount) {
    chromosomeSize = generateChromosomeSize();
    generateChromosomes();
  }

  Population.fromPopulation(
      this.startRange,
      this.endRange,
      this.populationAmount,
      this.chromosomeSize,
      this.chromosomes);

  void generateChromosomes() {
    var firstGenes = <int>[];
    var secondGenes = <int>[];
    var rnd = Random();

    for (var i = 0; i < populationAmount; i++) {
      for (var j = 0; j < chromosomeSize; j++) {
        firstGenes.add(rnd.nextInt(2));
        secondGenes.add(rnd.nextInt(2));
      }
      chromosomes.add(Chromosome(firstGenes, secondGenes));
      firstGenes = [];
      secondGenes = [];
    }
  }

  int generateChromosomeSize() {
    var range = (endRange - startRange) * pow(10, CHROMOSOME_ACCURACY);
    return ((log(range) / log(2)) + 1).toInt();
  }

  double decimalFirstNumber(int i) {
    var decimal = startRange +
        int.parse(chromosomes[i].firstGenesToString(), radix: 2) *
            (endRange - startRange) /
            (pow(2, chromosomeSize) - 1);
    return double.parse(decimal.toStringAsFixed(CHROMOSOME_ACCURACY));
  }

  double decimalSecondNumber(int i) {
    var decimal = startRange +
        int.parse(chromosomes[i].secondGenesToString(), radix: 2) *
            (endRange - startRange) /
            (pow(2, chromosomeSize) - 1);
    return double.parse(decimal.toStringAsFixed(CHROMOSOME_ACCURACY));
  }

  int getPopulationAmount() {
    return populationAmount;
  }

  List<Chromosome> getChromosomes() {
    return chromosomes;
  }

  void setChromosomes(chromosomes) {
    this.chromosomes = chromosomes;
  }
}
