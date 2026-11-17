import 'package:flutter/material.dart';

InputDecoration getInputDecoration(String label) {
  return InputDecoration(
    hintText: label,
    fillColor: Colors.blueGrey.shade100,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(60),
      borderSide: BorderSide(color: Colors.black, width: 2),
    ),
  );
}
