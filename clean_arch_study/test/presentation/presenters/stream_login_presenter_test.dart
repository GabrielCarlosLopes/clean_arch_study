// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

abstract class Validation {
  String validate({@required String field, @required String value});
}

class StramLoginPresenter {
  final Validation validation;
  StramLoginPresenter({
    @required this.validation,
  });
  void validateEmail(String email) {
    validation.validate(field: 'email', value: email);
  }
}

class ValidationSpy extends Mock implements Validation {}

void main() {
  test('should call validation with correct email', () {
    final validation = ValidationSpy();
    final sut = StramLoginPresenter(validation: validation);
    final email = faker.internet.email();

    sut.validateEmail(email);

    verify(validation.validate(field: 'email', value: email)).called(1);
  });
}
