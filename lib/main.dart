import 'package:flutter/material.dart';
import 'package:portifolio_flutter/controllers/navigation_provider.dart';
import 'package:portifolio_flutter/controllers/theme_controller.dart';
import 'package:portifolio_flutter/theme/app_theme.dart';
import 'package:portifolio_flutter/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: Consumer<ThemeController>(
        builder: (context, themeController, child) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeController.themeMode,
            home: HomeView(),
          );
        },
      ),
    );
  }
}
