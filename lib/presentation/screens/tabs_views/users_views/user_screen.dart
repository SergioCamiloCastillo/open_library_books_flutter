import 'package:bookstore_flutter/presentation/providers/forms/user_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(userFormProvider);
    final formNotifier = ref.read(userFormProvider.notifier);

    final birthDateController = TextEditingController(
      text: formState.birthDate.value != null
          ? formState.birthDate.value!.toLocal().toString().split(' ')[0]
          : '',
    );

    final size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFF8EFEB), Color(0xFFE4E3FC)],
              ),
            ),
          ),
          title: const Text('Módulo de Usuario'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.9,
                  child: _buildTextFormField(
                    context,
                    label: 'Nombre',
                    initialValue: formState.name.value,
                    errorText: formState.isSubmitted && !formState.name.isValid
                        ? 'Nombre inválido'
                        : null,
                    onChanged: (value) => formNotifier.updateName(value),
                    isSubmitted: formState.isSubmitted,
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: size.width * 0.9,
                  child: _buildTextFormField(
                    context,
                    label: 'Apellido',
                    initialValue: formState.lastName.value,
                    errorText:
                        formState.isSubmitted && !formState.lastName.isValid
                            ? 'Apellido inválido'
                            : null,
                    onChanged: (value) => formNotifier.updateLastName(value),
                    isSubmitted: formState.isSubmitted,
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: size.width * 0.9,
                  child: _buildTextFormField(
                    context,
                    label: 'Teléfono',
                    initialValue: formState.phone.value,
                    keyboardType: TextInputType.number,
                    errorText: formState.isSubmitted && !formState.phone.isValid
                        ? 'Teléfono inválido'
                        : null,
                    onChanged: (value) => formNotifier.updatePhone(value),
                    isSubmitted: formState.isSubmitted,
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: size.width * 0.9,
                  child: _buildTextFormField(
                    context,
                    label: 'Correo Electrónico',
                    initialValue: formState.email.value,
                    errorText: formState.isSubmitted && !formState.email.isValid
                        ? 'Correo electrónico inválido'
                        : null,
                    onChanged: (value) => formNotifier.updateEmail(value),
                    isSubmitted: formState.isSubmitted,
                  ),
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    formNotifier.updateBirthDate(selectedDate);
                    birthDateController.text = selectedDate != null
                        ? selectedDate.toLocal().toString().split(' ')[0]
                        : '';
                  },
                  child: AbsorbPointer(
                    child: SizedBox(
                      width: size.width * 0.9,
                      child: _buildTextFormField(
                        context,
                        label: 'Fecha de Nacimiento',
                        controller: birthDateController,
                        errorText: formState.isSubmitted &&
                                !formState.birthDate.isValid
                            ? 'Fecha de nacimiento inválida'
                            : null,
                        onChanged: (_) {},
                        isSubmitted: formState.isSubmitted,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Edad: ${formState.age}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: size.width * 0.9,
                  child: DropdownButtonFormField<String>(
                    value: formState.gender,
                    decoration: const InputDecoration(
                      labelText: 'Género',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Masculino', 'Femenino', 'Otro']
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                    onChanged: (value) => formNotifier.updateGender(value),
                  ),
                ),
                const SizedBox(height: 30.0),
                SizedBox(
                  width: size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () async {
                      formNotifier.updateIsSubmitted(true);

                      if (formKey.currentState?.validate() ?? false) {
                        if (formState.isValid) {
                          await formNotifier.saveUserData();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Por favor, corrige los errores en el formulario.'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Por favor, completa todos los campos requeridos.'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFF8EFEB), Color(0xFFE4E3FC)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        alignment: Alignment.center,
                        child: formState.isSaving
                            ? const CircularProgressIndicator()
                            : const Text(
                                'Guardar Información',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
    BuildContext context, {
    required String label,
    String? initialValue,
    String? errorText,
    TextEditingController? controller,
    TextInputType? keyboardType,
    required void Function(String) onChanged,
    required bool isSubmitted,
  }) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        errorText: isSubmitted && errorText != null ? errorText : null,
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es obligatorio';
        }
        return null;
      },
    );
  }
}
