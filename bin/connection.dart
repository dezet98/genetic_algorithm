import 'genetic_algorithm_create.dart';

class Connection {
  Connection();

  void connect() {
    GeneticAlgorithmCreate(-10, 10, 20, 5, 0.2, 0.2, 0.2, 0.2, 4,
        'maximal_grade', 'best', 'three_points_cross', 'one_point_mutation');
  }
}
