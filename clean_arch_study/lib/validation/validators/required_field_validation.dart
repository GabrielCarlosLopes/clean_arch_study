import '../protocols/protocols.dart';

class RequiredFieldValidation implements FieldValidtion {
  final String field;

  RequiredFieldValidation(this.field);

  String validate(String value) {
    return value?.isNotEmpty == true ? null : 'Campo obrigatório';
  }
}
