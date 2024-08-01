import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Ajusta la separación del bottom
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
        child: BottomNavigationBar(
          backgroundColor: Colors.white.withOpacity(0.8), // Color de fondo
          elevation: 10, // Sombra
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Color(0xFFACABAC),
                size: 28,
              ),
              label: '', // Etiqueta vacía
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Color(0xFFACABAC),
                size: 28,
              ),
              label: '', // Etiqueta vacía
            ),
          ],
          selectedItemColor: Colors.blue, // Color del ítem seleccionado
          unselectedItemColor:
              const Color(0xFFACABAC), // Color de los ítems no seleccionados
          showSelectedLabels: false, // Oculta etiquetas seleccionadas
          showUnselectedLabels: false, // Oculta etiquetas no seleccionadas
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
