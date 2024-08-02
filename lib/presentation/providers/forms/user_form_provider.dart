import 'package:bookstore_flutter/presentation/widgets/shared/infrastructure/inputs/inputs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final userFormProvider =
    StateNotifierProvider<UserFormNotifier, UserFormState>((ref) {
  return UserFormNotifier();
});

class UserFormNotifier extends StateNotifier<UserFormState> {
  UserFormNotifier() : super(UserFormState());

  void updateName(String value) {
    state = state.copyWith(name: Name.dirty(value));
  }

  void updateLastName(String value) {
    state = state.copyWith(lastName: LastName.dirty(value));
  }

  void updatePhone(String value) {
    state = state.copyWith(phone: Phone.dirty(value));
  }

  void updateEmail(String value) {
    state = state.copyWith(email: Email.dirty(value));
  }

  void updateBirthDate(DateTime? value) {
    if (value != null) {
      final age = DateTime.now().year - value.year;
      state = state.copyWith(
        birthDate: BirthDate.dirty(value),
        age: age,
      );
    } else {
      state = state.copyWith(birthDate: const BirthDate.dirty(null));
    }
  }

  void updateGender(String? value) {
    state = state.copyWith(gender: value);
  }

  void updateIsSubmitted(bool isSubmitted) {
    state = state.copyWith(isSubmitted: isSubmitted);
  }

  Future<void> saveUserData() async {
    state = state.copyWith(isSaving: true);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(isSaving: false);
    // Aquí puedes añadir la lógica para persistir los datos
  }
}

class UserFormState {
  final Name name;
  final LastName lastName;
  final Phone phone;
  final Email email;
  final BirthDate birthDate;
  final int age;
  final String? gender;
  final bool isSaving;
  final bool isSubmitted; // Nueva propiedad para verificar si el formulario fue enviado

  bool get isValid =>
      name.isValid &&
      lastName.isValid &&
      phone.isValid &&
      email.isValid &&
      birthDate.isValid;

  UserFormState({
    this.name = const Name.pure(),
    this.lastName = const LastName.pure(),
    this.phone = const Phone.pure(),
    this.email = const Email.pure(),
    this.birthDate = const BirthDate.pure(),
    this.age = 0,
    this.gender,
    this.isSaving = false,
    this.isSubmitted = false, // Inicializa la propiedad
  });

  UserFormState copyWith({
    Name? name,
    LastName? lastName,
    Phone? phone,
    Email? email,
    BirthDate? birthDate,
    int? age,
    String? gender,
    bool? isSaving,
    bool? isSubmitted, // Añade la propiedad en copyWith
  }) {
    return UserFormState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      isSaving: isSaving ?? this.isSaving,
      isSubmitted: isSubmitted ?? this.isSubmitted, // Actualiza la propiedad
    );
  }
}