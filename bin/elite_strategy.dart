import 'chromosome.dart';
import 'population.dart';

class EliteStrategy {
  int eliteStrategyAmount;
  List<Chromosome> eliteChromosome = [];

  EliteStrategy(this.eliteStrategyAmount);

  Population getBestFromPopulation(Population population) {
    var populationWithoutElite = Population.fromPopulation(population.startRange, population.endRange,
    population.populationAmount, population.chromosomeSize, population.getChromosomes());

    // print(populationWithoutElite.getChromosomes());

    population.getChromosomes().sort((a, b) => b.getGrade().compareTo(a.getGrade()));

    for(var i = 0; i< eliteStrategyAmount ;i++){
      eliteChromosome.add(population.getChromosomes()[i]);
    }

    // print(population);
    // print(eliteChromosome);

    var chromosomes = populationWithoutElite.getChromosomes(); // zupełnie nowy obiekt

    for(var i = 0; i< eliteChromosome.length; i++){
      chromosomes.remove(eliteChromosome[i]);
    }

    populationWithoutElite.setChromosomes(chromosomes);

    // print(populationWithoutElite.chromosomes);

    return populationWithoutElite;
  }



  Population setBestToPopulation(Population population) {

    var chromosomes = population.getChromosomes();
    for(var i = 0; i < eliteChromosome.length; i++){
      chromosomes.add(eliteChromosome[i]);
    }
    eliteChromosome = [];

    population.setChromosomes(chromosomes);
    return population;
  }
}
