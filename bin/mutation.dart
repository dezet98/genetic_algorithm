import 'population.dart';

abstract class Mutation {
  Population mutation(population);
}

class OnePointMutation implements Mutation {
  var mutationProbability;
  var maximization;

  OnePointMutation(this.mutationProbability, this.maximization);

  @override
  Population mutation(population) {
    // TODO: implement mutation
    return population;
  }
}

class TwoPointsMutation implements Mutation {
  var mutationProbability;
  var maximization;

  TwoPointsMutation(this.mutationProbability, this.maximization);

  @override
  Population mutation(population) {
    // TODO: implement mutation
    return population;
  }
}

class EdgeMutation implements Mutation {
  var mutationProbability;
  var maximization;

  EdgeMutation(this.mutationProbability, this.maximization);

  @override
  Population mutation(population) {
    // TODO: implement mutation
    return population;
  }
}
