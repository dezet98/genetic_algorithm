import 'genetic_algorithm.dart';

enum SeletionMethods { best, roulette, tournament }

class Selection {
  static void selection(SeletionMethods method) {
    switch (method) {
      case SeletionMethods.best:
        best_selection();
        break;
      case SeletionMethods.roulette:
        roulette_selection();
        break;
      case SeletionMethods.tournament:
        tournament_selection();
        break;
    }
  }

  static void best_selection() {
    print('best_selection');
  }

  static void roulette_selection() {
    print('roulette_selection');
  }

  static void tournament_selection() {
    print('tournament_selection');
  }
}
