enum DomainError { unexpected, invalidCredentials }

extension DomainErrorExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.invalidCredentials:
        return 'Credeciais inválidas.';
        break;
      default:
        return '';
    }
  }
}
