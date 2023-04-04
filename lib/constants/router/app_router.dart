import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/new_invoice.dart';
import 'package:invoiceapp/src/features/shared/services/get_it.dart';

AppRouter get appRouter {
  return getIt.get<AppRouter>();
}

class AppRouter {
  final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
        path: '/',
        builder: (context, state) {
          final providers = [EmailAuthProvider()];
          return SafeArea(
            child: Scaffold(
              body: SignInScreen(
                providers: providers,
                actions: [
                  AuthStateChangeAction<SignedIn>((context, state) {
                    context.go('/invoices');
                  }),
                ],
              ),
            ),
          );
        },
        routes: <GoRoute>[
          GoRoute(
            path: 'invoices',
            builder: _invoiceScreen,
          ),
          GoRoute(
            path: 'newInvoice',
            builder: _newInvoiceScreen,
          ),
        ]),
  ]);
}

Widget _invoiceScreen(BuildContext context, GoRouterState state) =>
    const InvoiceScreen();

Widget _newInvoiceScreen(BuildContext context, GoRouterState state) =>
    const NewInvoice();
