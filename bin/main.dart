import 'connection.dart';

void main() {
  var connection = Connection();
  var result = connection.connect();

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
