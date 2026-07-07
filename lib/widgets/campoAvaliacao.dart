import 'package:flutter/material.dart';

import 'buildInputDecoration.dart';

Widget CampoAvaliacao(@required String texto, @required int cor, @required double tamanho) {
  return SizedBox(
    width: tamanho,
    height: 42,
    child: TextField(
      textAlign: .center,
      readOnly: true,
      decoration: InputStylesCalculadora.BuildInputDecorationCalculadora(texto, cor),
    ),
  );
}