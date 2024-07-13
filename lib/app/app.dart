import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reddit_task/app/app_theme.dart';
import 'package:reddit_task/core/resources/app_strings.dart';
import 'package:reddit_task/presentation/pages/video/view/video_screen.dart';

/// here the start of your material app.

/// i useing native navigator with no plugens
/// and you can use static navigators functions inside AppRouter
/// class to navigat with only one PageRoute way and change it any
/// time you need

/// Any generic cubit or bloc add it here please.

// to get current context from any where
final GlobalKey<NavigatorState> appKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool isSecured = true;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      setState(() {
        isSecured = false;
      });
    } else {
      setState(() {
        isSecured = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: appKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(context),
      home: const VideoScreen(),
    );
  }
}
