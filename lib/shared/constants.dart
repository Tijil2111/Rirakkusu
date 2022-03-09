import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintStyle: TextStyle(color: Colors.deepOrange),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.deepOrange, width: 2)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.deepOrange, width: 2)),
);
