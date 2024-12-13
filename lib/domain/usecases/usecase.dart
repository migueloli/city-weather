abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Type> call(Params params);
}

// For use cases that don't need parameters
class NoParams {
  const NoParams();
}
