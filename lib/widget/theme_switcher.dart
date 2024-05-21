import 'package:flutter/material.dart';
import 'package:login_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeProvider>();
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(animation),
            child: child);
      },
      child: IconButton(
        key: ValueKey<bool>(themeNotifier.isDark),
        icon: Icon(
          themeNotifier.isDark ? Icons.dark_mode : Icons.light_mode,
          size: 36.0,
        ),
        onPressed: () {
          themeNotifier.changeTheme();
        },
      ),
    );
  }
}
