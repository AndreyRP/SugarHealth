import 'package:flutter/material.dart';

import 'buildInputDecoration.dart';

Widget CampoAvaliacao(@required String texto, @required int cor) {
  return SizedBox(
    width: 150,
    height: 42,
    child: TextField(
      textAlign: .center,
      readOnly: true,
      decoration: InputStylesCalculadora.BuildInputDecorationCalculadora(texto, cor),
    ),
  );
}