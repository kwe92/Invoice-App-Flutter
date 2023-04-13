import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/authentication/presentation/profile_screen.dart';
import 'package:invoiceapp/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:invoiceapp/src/features/edit_invoice/presentation/edit_invoice_screen.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/new_invoice_screen/presentation/new_invoice_screen.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/services/get_it.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

AppRouter get appRouter {
  return getIt.get<AppRouter>();
}

class AppRouter {
  final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(path: '/', builder: _signInScreen, routes: <GoRoute>[
      GoRoute(
        path: 'invoices',
        builder: _invoiceScreen,
      ),
      GoRoute(
        path: 'newInvoice',
        builder: _newInvoiceScreen,
      ),
      GoRoute(path: 'profile', builder: _profileScreen),
      // TODO: Create edit Invoice screen
      GoRoute(
          path: 'editInvoice',
          builder: (context, state) {
            final docId = state.extra as String;
            return EditInvoiceScreen(
              docId: docId,
            );
          })
    ]),
  ]);
}

Widget _invoiceScreen(BuildContext context, GoRouterState state) =>
    const InvoiceScreen();

Widget _newInvoiceScreen(BuildContext context, GoRouterState state) =>
    const NewInvoice();

Widget _signInScreen(BuildContext context, GoRouterState state) =>
    const CustomSignInScreen();

Widget _profileScreen(BuildContext context, GoRouterState state) =>
    const CustomProfileScreen();
