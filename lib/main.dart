import 'package:flutter/material.dart';
import 'package:login_provider/constant/theme.dart';
import 'package:login_provider/provider/auth_provider.dart';
import 'package:login_provider/provider/theme_provider.dart';
import 'package:login_provider/screen/login_screen.dart';
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
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeProvider.isDark ? darkTheme : lightTheme,
          home: const LoginScreen(),
        );
      }),
    );
  }
}
