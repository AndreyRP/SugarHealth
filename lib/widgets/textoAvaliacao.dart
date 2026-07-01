import 'package:flutter/material.dart';

import 'buildInputDecoration.dart';

Widget TextoAvaliacao(@required String texto) {
  return Text(texto,
      style:TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ));
}