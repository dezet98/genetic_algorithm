class Chromosome {
  var firstGenes;
  var secondGenes;
  double grade;

  Chromosome(this.firstGenes, this.secondGenes);

  String firstGenesToString() {
    var genesFirstString = StringBuffer();
    for (var i = 0; i < firstGenes.length; i++) {
      genesFirstString.write(firstGenes[i]);
    }
    return genesFirstString.toString();
  }

  String secondGenesToString() {
    var genesSecondString = StringBuffer();
    for (var i = 0; i < secondGenes.length; i++) {
      genesSecondString.write(secondGenes[i]);
    }
    return genesSecondString.toString();
  }

  List<int> getFirstGenes() {
    return firstGenes;
  }

  List<int> getSecondGenes() {
    return secondGenes;
  }

  double getGrade() {
    return grade;
  }

  void setGrade(grade) {
    this.grade = grade;
  }

  @override
  String toString() {
    return grade.toString();
  }
}
