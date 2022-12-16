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
    return value?.isNotEmpty == true ? null : 'Campo obrigatório';
  }
}

void main() {
  RequiredFieldValidation sut;
  setUp(() {
    sut = RequiredFieldValidation('any_field');
  });
  test('Should return null if value is not empty', () {
    expect(sut.validate('any_value'), null);
  });
  test('Should return error if value is empty', () {
    expect(sut.validate(''), 'Campo obrigatório');
  });
  test('Should return error if value is null', () {
    expect(sut.validate(null), 'Campo obrigatório');
  });
}
