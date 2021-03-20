import 'chromosome.dart';
import 'selection.dart';

class Population {
  List<Chromosome> chromosomes;

  Population(this.chromosomes);

  void selection(SeletionMethods method) {
    Selection.selection(method);
  }
}
