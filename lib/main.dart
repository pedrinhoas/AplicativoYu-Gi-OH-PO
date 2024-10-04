import 'package:flutter/material.dart';

import 'package:jkpapk/jogo.dart';

void main() {
  runApp(_buildApp());
}

Widget _buildApp() {
  return const MaterialApp(
    home: Jogo(),
    debugShowCheckedModeBanner: false,
  );
}