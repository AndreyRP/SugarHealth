import 'package:flutter/material.dart';

Widget TextoPadrao(String texto) {
  return Text(
    texto,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      decoration: TextDecoration.none, // Garante que não há sublinhado visual
    ),
  );
}

Widget TextoPadraoBold(String texto) {
  return Text(
    texto,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      decoration: TextDecoration.none, // Garante que não há sublinhado visual
    ),
  );
}

Widget TextoTitulos(String texto) {
  return Text(
    texto,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      decoration: TextDecoration.none, // Garante que não há sublinhado visual
    ),
  );
}