import 'genetic_algorithm_create.dart';

class Connection {
  Connection();

  void connect() {
    GeneticAlgorithmCreate(-10, 10, 20, 5, 0.2, 0.2, 0.2, 0.2, 4,
        'maximal_grade', 'best', 'homogeneous_cross', 'edge_mutation');
  }
}
