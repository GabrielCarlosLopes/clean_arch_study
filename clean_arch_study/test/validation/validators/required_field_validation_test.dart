// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test/test.dart';

abstract class FieldValidtion {
  String get field;
  String validate(String value);
}

class RequiredFieldValidation implements FieldValidtion {
  final String field;

  RequiredFieldValidation(this.field);

  String validate(String value) {
    return null;
  }
}

void main() {
  test('Should return null if value is not empty', () {
    final sut = RequiredFieldValidation('any_field');

    final error = sut.validate('any_value');

    expect(error, null);
  });
}
