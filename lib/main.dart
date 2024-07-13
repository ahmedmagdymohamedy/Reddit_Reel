import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reddit_task/app/app.dart';
import 'package:reddit_task/core/managers/shared_preferences_manager.dart';
import 'package:reddit_task/core/resources/app_assets.dart';
import 'package:reddit_task/core/resources/app_languages.dart';

Future<void> main() async {
  // Start point of the project ..
  // here you can create an initialization for any plugin that require init before run app.

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.init();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [
        for (var value in LanguageType.values) Locale(value.getValue())
      ],
      path: AppAssets.localizationPath,
      fallbackLocale: Locale(LanguageType.ENGLISH.getValue()),
      child: const MyApp(),
    ),
  );
}
