import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_2024/core/dependecy_injection.dart';
import 'package:pokedex_2024/ui/features/splash/splash_screen.dart';
import 'package:pokedex_2024/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  DependecyInjection.registerInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, provider, _) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp(
              title: 'Pokedex',
              theme: provider.lightTheme,
              darkTheme: provider.darkTheme,
              themeMode: provider.themeMode,
              home: const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
