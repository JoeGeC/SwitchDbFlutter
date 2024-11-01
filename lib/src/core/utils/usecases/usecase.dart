import 'package:dartz/dartz.dart';
import '../../network/failure/failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}
