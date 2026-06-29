import 'package:flutter/material.dart';

Widget BuildBoxTexto(String text, {Alignment alignment = Alignment.centerLeft}) {
  return Container(
    height: 42,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.black,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Align(
        alignment: alignment,
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 10),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        )
    ),
  );
}