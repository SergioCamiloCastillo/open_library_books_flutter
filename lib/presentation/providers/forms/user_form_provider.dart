import 'package:bookstore_flutter/presentation/widgets/shared/infrastructure/inputs/inputs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:formz/formz.dart';

final userFormProvider =
    StateNotifierProvider<UserFormNotifier, UserFormState>((ref) {
  return UserFormNotifier()..loadUserData();
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

  Future<void> saveUserData() async {
    state = state.copyWith(isSaving: true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', state.name.value);
    await prefs.setString('lastName', state.lastName.value);
    await prefs.setString('phone', state.phone.value);
    await prefs.setString('email', state.email.value);
    await prefs.setString(
        'birthDate', state.birthDate.value?.toIso8601String() ?? '');
    await prefs.setInt('age', state.age);
    await prefs.setString('gender', state.gender ?? '');
    state = state.copyWith(isSaving: false);
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name') ?? '';
    final lastName = prefs.getString('lastName') ?? '';
    final phone = prefs.getString('phone') ?? '';
    final email = prefs.getString('email') ?? '';
    final birthDateString = prefs.getString('birthDate') ?? '';
    final birthDate =
        birthDateString.isNotEmpty ? DateTime.parse(birthDateString) : null;
    final age = prefs.getInt('age') ?? 0;
    final gender = prefs.getString('gender');

    state = state.copyWith(
      name: Name.dirty(name),
      lastName: LastName.dirty(lastName),
      phone: Phone.dirty(phone),
      email: Email.dirty(email),
      birthDate: BirthDate.dirty(birthDate),
      age: age,
      gender: gender,
    );
  }

  void updateIsSubmitted(bool isSubmitted) {
    state = state.copyWith(isSubmitted: isSubmitted);
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
  final bool isSubmitted;

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
    this.isSubmitted = false,
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
    bool? isSubmitted,
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
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}