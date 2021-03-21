class Population {
  var startRange;
  var endRange;
  var populationAmount;
  var chromosomes;

  Population(this.startRange, this.endRange, this.populationAmount) {
    generateChromosomes();
  }

  void generateChromosomes() {
    chromosomes = List.empty();
  }

  void evaluate() {}
}
