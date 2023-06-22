import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quizzly/controllers/lang_controller.dart';
import 'package:quizzly/services/l10n/app_localization.dart';
import 'package:quizzly/views/app_routes.dart';

class RunApp extends StatelessWidget {
  const RunApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LangController.currentLang,
      builder: (context , lang , _) {
        return MaterialApp(
          title: 'Localizations App',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('uz'),
            Locale('ru'),
          ],
          locale: Locale(lang),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      }
    );
  }
}

