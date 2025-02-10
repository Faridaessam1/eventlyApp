import 'package:bot_toast/bot_toast.dart';
import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/core/services/loading_services.dart';
import 'package:evently_app/core/services/local_storage_service.dart';
import 'package:evently_app/provider/app_language_provider.dart';
import 'package:evently_app/provider/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'core/theme/app_theme_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AppLanguageProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AppThemeProvider(),
    )
  ], child: const MyApp()));

  ConfigLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var ThemeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppThemeManager.lightData,
      darkTheme: AppThemeManager.darkData,
      themeMode: ThemeProvider.appTheme,
      navigatorKey: navigatorKey,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
