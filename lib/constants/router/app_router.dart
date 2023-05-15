import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/view_invoice_screen.dart';
import 'package:invoiceapp/src/features/authentication/presentation/profile_screen.dart';
import 'package:invoiceapp/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:invoiceapp/src/features/edit_invoice/presentation/edit_invoice_screen.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/new_invoice_screen/presentation/new_invoice_screen.dart';
import 'package:invoiceapp/src/features/shared/services/get_it.dart';

// TODO: Clean up hard coded strings
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
      GoRoute(path: 'editInvoice', builder: _editInvoice),
      GoRoute(path: 'viewInvoice', builder: _viewInvoiceScreen)
    ]),
  ]);
}

Widget _invoiceScreen(BuildContext context, GoRouterState state) => const InvoiceScreen();

Widget _newInvoiceScreen(BuildContext context, GoRouterState state) => const NewInvoice();

Widget _signInScreen(BuildContext context, GoRouterState state) => const CustomSignInScreen();

Widget _profileScreen(BuildContext context, GoRouterState state) => const CustomProfileScreen();

Widget _viewInvoiceScreen(BuildContext context, GoRouterState state) {
  final invoice = state.extra as InvoiceFormModel;
  return ViewInvoiceScreen(invoice: invoice);
}

Widget _editInvoice(context, GoRouterState state) {
  final Map stateObj = state.extra as Map;
  final String docId = stateObj['docId'];
  final String invoiceId = stateObj['invoiceId'];
  print('DOC ID: $docId');
  return EditInvoiceScreen(
    docId: docId,
    invoiceId: invoiceId,
  );
}
