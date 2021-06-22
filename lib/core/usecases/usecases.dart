import 'package:either_dart/either.dart';

import '../../domain/errors/errors.dart';

abstract class Usecase<Input, Output> {
  Future<Either<Failure, Output>> call(Input input);
}

class NoParams {}
