import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yande_gui/global.dart';

import 'package:yande_gui/src/rust/frb_generated.dart';

import 'pages/index/index_page.dart';
import 'services/settings_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RustLib.init();
  final packageInfo = await PackageInfo.fromPlatform();
  Global.appVersion = packageInfo.version;
  Global.buildNumber = packageInfo.buildNumber;
  await SettingsService.initialize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const darkPrimaryColor = Color(0xfff175a9);
    const lightPrimaryColor = Color(0xffef83be);
    const secondaryColor = Color(0xff28a4ff);

    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;

    return StreamBuilder(
      stream: rootUpdateController.stream,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return MaterialApp(
          title: 'Yande GUI',
          home: const IndexPage(),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: darkPrimaryColor,
            useMaterial3: true,
            colorScheme: const ColorScheme.dark(
              primary: darkPrimaryColor,
              secondary: secondaryColor,
              // background: Color(0xff1c1c1c),
              // onBackground: Color(0xff8e8e8e),
              surface: Color(0xff121212),
              onSurface: Color(0xffe6e1e5),
            ),
            scaffoldBackgroundColor: const Color(0xff1c1c1c),
            inputDecorationTheme: const InputDecorationTheme(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ),
            navigationRailTheme: const NavigationRailThemeData(
              indicatorColor: darkPrimaryColor,
            ),
            cardTheme: const CardTheme(
              color: Color(0xff181818),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: darkPrimaryColor,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 8, vertical: 15)),
                // minimumSize: WidgetStateProperty.all(const Size(20, 35)),
              ),
            ),
          ),
          theme: ThemeData(
            primaryColor: lightPrimaryColor,
            useMaterial3: true,
            colorScheme: const ColorScheme.light(
              primary: lightPrimaryColor,
              secondary: secondaryColor,
              // background: Color(0xfff0f0f0),
              // onBackground: Color(0xff1c1c1c),
              surface: Color(0xfffffefe),
              onSurface: Color(0xff1c1c1c),
            ),
            scaffoldBackgroundColor: const Color(0xfff0f0f0),
            inputDecorationTheme: const InputDecorationTheme(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ),
            navigationRailTheme: const NavigationRailThemeData(
              indicatorColor: lightPrimaryColor,
              // backgroundColor: Color(0xff1c1c1c),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: lightPrimaryColor,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 8, vertical: 15)),
                minimumSize: WidgetStateProperty.all(const Size(20, 35)),
              ),
            ),
          ),
          themeMode: switch (SettingsService.themeMode) {
            0 => ThemeMode.system,
            1 => ThemeMode.light,
            2 => ThemeMode.dark,
            _ => ThemeMode.system,
          },
          locale: systemLocale,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (final supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(
            builder: (context, child) {
              return GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}
