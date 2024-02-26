import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    hintStyle: const TextStyle(fontSize: 13.0),
    contentPadding: const EdgeInsets.only(left: 12.0),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
            width: 1.0, color: Colors.blue, style: BorderStyle.solid)));
