import 'package:flutter/material.dart';

class InputStyles {

  static InputDecoration BuildInputDecoration(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Color(0xffACA4A4),
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