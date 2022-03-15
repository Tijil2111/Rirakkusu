import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

var textInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintStyle: TextStyle(color: HexColor("#80E7FA")),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: HexColor("#80E7FA"), width: 2)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: HexColor("#80E7FA"), width: 2)),
);
