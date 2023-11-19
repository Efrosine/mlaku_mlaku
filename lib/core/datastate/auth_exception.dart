class SignUpEnPException implements Exception {
  const SignUpEnPException([this.message = 'An unkown exception']);

  factory SignUpEnPException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpEnPException(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpEnPException(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpEnPException(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpEnPException(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpEnPException(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpEnPException();
    }
  }

  final String message;
}

class LogInEnPException implements Exception {
  const LogInEnPException([this.message = 'An unkown exception']);

  factory LogInEnPException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInEnPException(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInEnPException(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInEnPException(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInEnPException(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInEnPException();
    }
  }

  final String message;
}

class LogOutException implements Exception {}
