import 'package:formz/formz.dart';

enum BirthDateValidationError { empty }

class BirthDate extends FormzInput<DateTime?, String> {
  const BirthDate.pure([DateTime? value]) : super.pure(value);
  const BirthDate.dirty([DateTime? value]) : super.dirty(value);

  @override
  String? validator(DateTime? value) {
    return value == null ? 'Fecha inválida' : null;
  }
}
