abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure([super.message = 'A server error occurred.']);
}

class CacheFailure extends Failure {
  CacheFailure([super.message = 'A cache error occurred.']);
}

class AuthFailure extends Failure {
  AuthFailure([super.message = 'Authentication failed.']);
}
