import 'chromosome.dart';
import 'gene.dart';
import 'genetic_algorithm.dart';
import 'population.dart';

void main() {
  var geneticAlgorithm = GeneticAlgorithm(
    Population([
      Chromosome([
        Gene(1.5),
      ])
    ]),
  );

  geneticAlgorithm.run();
}
