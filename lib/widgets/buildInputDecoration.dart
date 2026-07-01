import 'package:flutter/material.dart';

class InputStylesCalculadora {

  static InputDecoration BuildInputDecorationCalculadora(String hint, int cor) {
    return InputDecoration(
      filled: true,
      fillColor: Color(cor),
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),

      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.black, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.black, width: 2.0),
      ),
    );
  }
}