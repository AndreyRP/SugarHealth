import 'package:flutter/material.dart';

Widget TextoAvaliacao(@required String texto) {
  return Text(texto,
      style:TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ));
}