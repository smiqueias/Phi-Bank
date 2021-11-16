import 'package:flutter/material.dart';
import 'package:phi_mobile_challenge/src/core/app.dart';
import 'package:phi_mobile_challenge/src/core/local-storage/local_storage.dart';
import 'package:phi_mobile_challenge/src/utils/constants/boxes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.start();
  await LocalStorage.open(amountVisibilityBox);

  runApp(const App());
}
