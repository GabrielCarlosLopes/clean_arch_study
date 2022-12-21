// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:ForDev/presentation/protocols/protocols.dart';
import 'package:ForDev/validation/protocols/protocols.dart';

void main() {
  ValidationComposite sut;
  FieldValidationSpy validation1;
  FieldValidationSpy validation2;
  FieldValidationSpy validation3;

  void mockValidation1(String error) {
    when(validation1.validate(any)).thenReturn(error);
  }

  void mockValidation2(String error) {
    when(validation2.validate(any)).thenReturn(error);
  }

  void mockValidation3(String error) {
    when(validation3.validate(any)).thenReturn(error);
  }

  setUp(() {
    validation1 = FieldValidationSpy();
    when(validation1.field).thenReturn('any_field');
    mockValidation1(null);
    validation2 = FieldValidationSpy();
    when(validation2.field).thenReturn('any_field');
    mockValidation2(null);
    validation3 = FieldValidationSpy();
    when(validation3.field).thenReturn('other_field');
    mockValidation3(null);
    sut = ValidationComposite([validation1, validation2, validation3]);
  });
  test('should return null if all validations returns null or empty', () {
    mockValidation2('');
    final error = sut.validate(field: 'any_field', value: 'any_value');

    expect(error, null);
  });
  test('should return the first error', () {
    mockValidation1('error_1');
    mockValidation2('error_2');
    mockValidation3('error_3');

    final error = sut.validate(field: 'any_field', value: 'any_value');

    expect(error, 'error_1');
  });
}

class FieldValidationSpy extends Mock implements FieldValidtion {}

class ValidationComposite implements Validation {
  final List<FieldValidtion> validations;

  ValidationComposite(this.validations);

  String validate({@required String field, @required String value}) {
    String error;
    for (final validation in validations) {
      error = validation.validate(value);
      if (error?.isNotEmpty == true) {
        return error;
      }
    }
    return error;
  }
}
