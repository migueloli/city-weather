import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Type> call(Params params);
}

// For use cases that don't need parameters
class NoParams implements Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => null;
}
