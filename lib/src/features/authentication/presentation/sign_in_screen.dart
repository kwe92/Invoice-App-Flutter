import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/firebase/app_firebase.dart';

class CustomSignInScreen extends StatelessWidget {
  static final _providers = [EmailAuthProvider()];

  const CustomSignInScreen({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: SignInScreen(
            providers: _providers,
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                AppFirebase.reloadUser();
                context.go('/invoices');
              }),
            ],
          ),
        ),
      );
}
