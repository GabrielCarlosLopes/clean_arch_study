// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:ForDev/presentation/protocols/protocols.dart';
import 'package:ForDev/validation/protocols/protocols.dart';

void main() {
  test('should return null if all validations returns null or empty', () {
    final validation1 = FieldValidationSpy();
    when(validation1.field).thenReturn('any_field');
    when(validation1.validate(any)).thenReturn(null);
    final validation2 = FieldValidationSpy();
    when(validation2.field).thenReturn('any_field');
    when(validation2.validate(any)).thenReturn('');

    final sut = ValidationComposite([validation1, validation2]);

    final error = sut.validate(field: 'any_field', value: 'any_value');

    expect(error, null);
  });
}

class FieldValidationSpy extends Mock implements FieldValidtion {}

class ValidationComposite implements Validation {
  final List<FieldValidtion> validations;

  ValidationComposite(this.validations);

  String validate({@required String field, @required String value}) {
    return null;
  }
}
