import 'package:formz/formz.dart';
enum PhoneValidationError { invalid }


class Phone extends FormzInput<String, PhoneValidationError> {
  const Phone.pure() : super.pure('');
  const Phone.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneValidationError? validator(String value) {
    final phoneRegExp = RegExp(r'^\d{1,10}$');
    return phoneRegExp.hasMatch(value) ? null : PhoneValidationError.invalid;
  }
}
