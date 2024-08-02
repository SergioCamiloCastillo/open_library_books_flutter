import 'package:formz/formz.dart';

// Define validation errors
enum NameValidationError { empty }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    return value.isNotEmpty ? null : NameValidationError.empty;
  }
}


