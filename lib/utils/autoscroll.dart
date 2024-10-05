// Función de auto-scroll
import 'package:flutter/material.dart';

void autoScroll({
  required ScrollController scrollController,
  required Offset globalPosition,
  required Size screenSize,
  double threshold = 200.0,
}) {
  final scrollPosition = scrollController.position;

  // Calcula la posición relativa al tamaño de la pantalla
  final distanceFromTop = globalPosition.dy;
  final distanceFromBottom = screenSize.height - distanceFromTop;

  // Determina la dirección del autoscroll y ajusta la velocidad
  if (distanceFromTop < threshold &&
      scrollPosition.pixels > scrollPosition.minScrollExtent) {
    scrollController.animateTo(
      scrollPosition.pixels - 12, // Mueve hacia arriba con menos desplazamiento
      duration: const Duration(
          milliseconds: 25), // Aumenta la duración de la animación
      curve: Curves.easeInOut, // Usa una curva más suave
    );
  } else if (distanceFromBottom < threshold &&
      scrollPosition.pixels < scrollPosition.maxScrollExtent) {
    scrollController.animateTo(
      scrollPosition.pixels + 12, // Mueve hacia abajo con menos desplazamiento
      duration: const Duration(
          milliseconds: 25), // Aumenta la duración de la animación
      curve: Curves.easeInOut, // Usa una curva más suave
    );
  }
}
