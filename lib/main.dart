import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'theme/theme_provider.dart';
import 'screens/splash_screen.dart';

/// Global theme provider – accessible from anywhere via LupaseApp.themeProvider
final ThemeProvider themeProvider = ThemeProvider();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LupaseApp());
}

class LupaseApp extends StatelessWidget {
  const LupaseApp({super.key});

  static ThemeProvider get themeNotifier => themeProvider;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, _) {
        return MaterialApp(
          title: 'Lupase',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const SplashScreen(),
        );
      },
    );
  }
}