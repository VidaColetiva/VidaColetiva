import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vidacoletiva/app.dart';
import 'package:vidacoletiva/firebase_options.dart';
import 'package:vidacoletiva/injection_setup.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initilizeDependencies();

  runApp(const VidaColetiva());
}
