import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(

    surface: Colors.grey.shade300, // The background color used for surfaces of components like cards, dialogs, and menus.

    primary: Colors.grey.shade500, // The primary color is used across prominent UI elements like app bars and buttons.
    // It represents the key color of your app.

    secondary: Colors.grey.shade200, // The secondary color is used to highlight interactive elements
    // like FABs (Floating Action Buttons) or selection controls.

    tertiary: Colors.grey.shade100, // A tertiary color is a less commonly used color that provides additional accents,
    // typically for smaller elements or tertiary content.

    inversePrimary: Colors.grey.shade900, // Inverse of the primary color, possibly for text or icons over a light background

  ),

  scaffoldBackgroundColor: Colors.grey.shade300,
);
