import 'package:flutter/material.dart';
import 'package:login_provider/provider/auth_provider.dart';
import 'package:login_provider/provider/theme_provider.dart';
import 'package:login_provider/screen/home_screen.dart';
import 'package:login_provider/widget/theme_switcher.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 36.0,
              height: 36.0,
            ),
            Text('Login Provider'),
            ThemeSwitcher(),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8.0),
            ),
            onPressed: authProvider.isLoading
                ? null
                : () async {
                    final navigator = Navigator.of(context);
                    await authProvider.login();

                    navigator.pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }), (route) => false);
                  },
            child: authProvider.isLoading
                ? const CircularProgressIndicator()
                : const Text('Login'),
          ),
        ),
      ),
    );
  }
}
