import 'package:flutter/material.dart';
import 'package:login_provider/provider/auth_provider.dart';
import 'package:login_provider/screen/login_screen.dart';
import 'package:login_provider/widget/theme_switcher.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 36.0,
              height: 36.0,
            ),
            const Text('kelvin handoko'),
            Row(
              children: [
                const ThemeSwitcher(),
                IconButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  onPressed: () async {
                    final navigator = Navigator.of(context);
                    await authProvider.logout();

                    navigator.pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }), (route) => false);
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            )
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Center(
        child: Text('Welcome to Home Screen'),
      ),
    );
  }
}
