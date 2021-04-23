import 'connection.dart';

void main() {
  var connection = Connection();
  var result = connection.connect(
      -10,      // startRange
      10,                 //  endRange
      100,                 //populationAmount
      100,                 //epochsAmount
      0.2,                //selectionProbability
      0.2,                //crossProbability
      0.2,                //mutationProbability
      3,                  //eliteStrategyAmount
      false,               // gradeStrategy
      'best',             //selection
      'heuristic_cross', //cross
      'uniform_mutation'  // mutation
      );

  print(' ');
  print('TO ZWRACAM NA FRONT');
  print('Czas algorytmu: ${result.algorithmTime}');
  print(' ');
  print('Wielkość populacji: ${result.populationSize}');
  print(' ');
  print('Ilość: ${result.populationSize}');
  print(' ');
  print('Najlepsi osobnicy w epokach: ${result.bestInEpoch}');
  print(' ');
  print('Średnia z osobników w epokach: ${result.averageInEpoch}');
  print(' ');
  print('Odchylenie standardowe w epokach: ${result.standardDeviation}');
}
