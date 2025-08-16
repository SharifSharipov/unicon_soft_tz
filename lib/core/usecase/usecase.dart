import 'package:unicon_soft_tz/core/either/either.dart';
import 'package:unicon_soft_tz/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Class to handle when useCase don't need params
class NoParams {}
