import 'package:flutter/material.dart';

Widget scoreBoard(String titulo, String dato) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            dato,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
