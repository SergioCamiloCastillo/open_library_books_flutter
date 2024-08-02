import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String message;
  final String imagePath;

  const InfoBox({
    Key? key,
    required this.message,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
          right: 16.0, left: 16, bottom: 20), // Ajusta el margen derecho
      height: 150.0, // Ajusta la altura aquí
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  18.0), // Aumenta el radio del borde para la imagen
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Filtro de color para mejorar la legibilidad del texto
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    18.0), // Aumenta el radio del borde para el filtro
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                ),
              ),
            ),
          ),
          // Texto sobre la imagen
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Ajusta el padding horizontal
              child: SizedBox(
                width: size.width * 0.5, // Ajusta el ancho del texto
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                  textAlign: TextAlign.start
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
