import 'population.dart';

abstract class Mutation {
  Population mutation(population);
}

class OnePointMutation implements Mutation {
  var mutationProbability;

  OnePointMutation(this.mutationProbability);

  @override
  Population mutation(population) {
    // TODO: implement mutation
    return population;
  }
}

class TwoPointsMutation implements Mutation {
  var mutationProbability;

  TwoPointsMutation(this.mutationProbability);

  @override
  Population mutation(population) {
    // TODO: implement mutation
    return population;
  }
}

class EdgeMutation implements Mutation {
  var mutationProbability;

  EdgeMutation(this.mutationProbability);

  @override
  Population mutation(population) {
    // TODO: implement mutation
    return population;
  }
}
