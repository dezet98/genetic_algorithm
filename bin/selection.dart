import 'chromosome.dart';
import 'population.dart';

abstract class Selection {
  Population selection(Population population);
}

class Best implements Selection {
  var selectionProbability;
  List<Chromosome> bestChromosome = [];

  Best(this.selectionProbability);
  @override
  Population selection(Population population) {

    // population.getChromosomes().sort((a, b) => b.getGrade().compareTo(a.getGrade()));
    //
    // var selectionElements = (population.getChromosomes().length * selectionProbability).toInt();
    //
    // for(var i = 0; i< selectionElements ;i++){
    //   bestChromosome.add(population.getChromosomes()[i]);
    // }
    //
    // population.setChromosomes(bestChromosome);

    return population;
  }
}

class Roulette implements Selection {

  @override
  Population selection(Population population) {
    // TODO: implement select
    return population;
  }
}

class Tournament implements Selection {

  @override
  Population selection(Population population) {
    // TODO: implement select
    return population;
  }
}
