import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider.autoDispose
    .family<UserNotifier, UserState, String>((ref, id) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState());

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void updatePhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateBirthDate(DateTime birthDate) {
    state = state.copyWith(birthDate: birthDate);
  }

  void updateAge(int age) {
    state = state.copyWith(age: age);
  }

  void updateGender(String gender) {
    state = state.copyWith(gender: gender);
  }

  Future<void> saveUserData() async {
    state = state.copyWith(isSaving: true);
    // Simula una llamada a una API o a una base de datos
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(isSaving: false);
    // Aquí puedes añadir lógica para guardar los datos
  }
}

class UserState {
  final String? name;
  final String? lastName;
  final String? phone;
  final String? email;
  final DateTime? birthDate;
  final int? age;
  final String? gender;
  final bool isLoading;
  final bool isSaving;

  UserState(
      {this.name,
      this.lastName,
      this.phone,
      this.email,
      this.birthDate,
      this.age,
      this.gender,
      this.isLoading = false,
      this.isSaving = false});

  UserState copyWith(
          {String? name,
          String? lastName,
          String? phone,
          String? email,
          DateTime? birthDate,
          int? age,
          String? gender,
          bool? isLoading,
          bool? isSaving}) =>
      UserState(
          name: name ?? this.name,
          lastName: lastName ?? this.lastName,
          phone: phone ?? this.phone,
          email: email ?? this.email,
          birthDate: birthDate ?? this.birthDate,
          age: age ?? this.age,
          gender: gender ?? this.gender,
          isLoading: isLoading ?? this.isLoading,
          isSaving: isSaving ?? this.isSaving);
}
