import 'package:bookstore_flutter/presentation/providers/forms/user_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _birthDateController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _birthDateController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final userFormNotifier = ref.read(userFormProvider.notifier);
      await userFormNotifier.loadUserData();
      final formState = ref.read(userFormProvider);
      if (mounted) {
        setState(() {
          _nameController.text = formState.name.value;
          _lastNameController.text = formState.lastName.value;
          _phoneController.text = formState.phone.value;
          _emailController.text = formState.email.value;
          _birthDateController.text = formState.birthDate.value != null
              ? formState.birthDate.value!.toLocal().toString().split(' ')[0]
              : '';
        });
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(userFormProvider);
    final formNotifier = ref.read(userFormProvider.notifier);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // Ajusta la altura del AppBar
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFF8EFEB), Color(0xFFE4E3FC)],
            ),
          ),
          child: AppBar(
            title: const Text('Módulo de Usuario',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            backgroundColor: Colors.transparent, // Hacer el color de fondo transparente
            elevation: 0, // Quitar la sombra del AppBar
            toolbarHeight: 56.0, // Ajusta la altura del AppBar si es necesario
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled, // Cambia la validación automática
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                _buildTextFormField(
                  label: 'Nombre',
                  controller: _nameController,
                  errorText: formState.name.isNotValid ? 'Nombre inválido' : null,
                  onChanged: formNotifier.updateName,
                ),
                const SizedBox(height: 10.0),
                _buildTextFormField(
                  label: 'Apellido',
                  controller: _lastNameController,
                  errorText: formState.lastName.isNotValid ? 'Apellido inválido' : null,
                  onChanged: formNotifier.updateLastName,
                ),
                const SizedBox(height: 10.0),
                _buildTextFormField(
                  label: 'Teléfono',
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  errorText: formState.phone.isNotValid ? 'Teléfono inválido' : null,
                  onChanged: formNotifier.updatePhone,
                ),
                const SizedBox(height: 10.0),
                _buildTextFormField(
                  label: 'Correo Electrónico',
                  controller: _emailController,
                  errorText: formState.email.isNotValid ? 'Correo electrónico inválido' : null,
                  onChanged: formNotifier.updateEmail,
                ),
                const SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    formNotifier.updateBirthDate(selectedDate);
                    _birthDateController.text = selectedDate != null
                        ? selectedDate.toLocal().toString().split(' ')[0]
                        : '';
                  },
                  child: AbsorbPointer(
                    child: _buildTextFormField(
                      label: 'Fecha de Nacimiento',
                      controller: _birthDateController,
                      errorText: formState.birthDate.isNotValid ? 'Fecha de nacimiento inválida' : null,
                      onChanged: (_) {},
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Edad: ${formState.age}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10.0),
                _buildGenderDropdown(formState, formNotifier),
                const SizedBox(height: 25.0),
                Container(
                  width: size.width * 1,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFF8EFEB), Color(0xFFE4E3FC)],
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        formNotifier.updateName(_nameController.text);
                        formNotifier.updateLastName(_lastNameController.text);
                        formNotifier.updatePhone(_phoneController.text);
                        formNotifier.updateEmail(_emailController.text);
                        formNotifier.updateBirthDate(DateTime.tryParse(_birthDateController.text));

                        formNotifier.updateIsSubmitted(true);

                        // Valida el formulario solo al hacer clic en el botón
                        if (_formKey.currentState?.validate() ?? false) {
                          try {
                            await formNotifier.saveUserData();
                            await formNotifier.loadUserData();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Datos guardados exitosamente.'),
                              ),
                            );
                          } catch (e) {
                            print('Error al guardar los datos: $e');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error al guardar los datos: $e'),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Por favor, corrige los errores en el formulario.'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // El color de fondo no se muestra porque se usa el gradiente
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                      ),
                      child: formState.isSaving
                          ? const CircularProgressIndicator()
                          : const Text(
                              'Guardar Información',
                              style: TextStyle(color: Colors.white),
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

  Widget _buildTextFormField({
    required String label,
    required TextEditingController controller,
    String? errorText,
    TextInputType? keyboardType,
    required void Function(String) onChanged,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        errorText: errorText,
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

  Widget _buildGenderDropdown(
    UserFormState formState,
    UserFormNotifier formNotifier,
  ) {
    return DropdownButtonFormField<String>(
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
      onChanged: (value) {
        formNotifier.updateGender(value ?? '');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Selecciona un género';
        }
        return null;
      },
    );
  }
}