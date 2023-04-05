import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomProfileScreen extends StatelessWidget {
  static final _providers = [EmailAuthProvider()];

  const CustomProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('Profile Screen')),
          body: ProfileScreen(
            providers: _providers,
            actions: [
              SignedOutAction((context) {
                context.pushReplacement('/');
              }),
            ],
          ),
        ),
      );
}
