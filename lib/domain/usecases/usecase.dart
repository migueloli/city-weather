abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

// For use cases that don't need parameters
class NoParams {
  const NoParams();
} 