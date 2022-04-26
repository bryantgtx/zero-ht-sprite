import 'package:flutter/material.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:bloc/bloc.dart';
import 'package:test/app.dart';
import 'package:test/common_assets.dart';

void main() async {
  FlutterServicesBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  await CommonAssets.initSpriteSheets();

  BlocOverrides.runZoned(
    () => runApp(TestApp()),
  );
}