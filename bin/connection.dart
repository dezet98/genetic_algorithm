import 'genetic_algorithm_create.dart';

class Connection {
  Connection();

  void connect() {
    GeneticAlgorithmCreate(-10, 10, 10, 5, 0.2, 0.2, 0.2, 4,
        'minimal_grade', 'best', 'one_point_cross', 'one_point_mutation');
  }
}
