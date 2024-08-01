import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 100, // Tamaño del loader
        height: 100, // Tamaño del loader
        child: LoadingIndicator(
          indicatorType: Indicator
              .lineSpinFadeLoader, // Tipo de indicador con un diseño circular
          strokeWidth: 8, // Ancho del trazo del indicador
          colors: [
            Colors.orange,
            Colors.red,
            Colors.yellow
          ], // Colores del indicador
          backgroundColor: Colors.transparent, // Fondo transparente
        ),
      ),
    );
  }
}
