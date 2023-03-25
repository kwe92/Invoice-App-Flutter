import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/new_invoice.dart';

class AppRouter {
  static const homeKey = Key('homeKey');
  static const newInvoiceKey = Key('newInvoiceKey');

  static final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(path: '/', builder: _homePath, routes: <GoRoute>[
      GoRoute(
        path: 'newInvoice',
        builder: (context, state) => const NewInvoice(),
      )
    ]),
  ]);
}

Widget _homePath(BuildContext context, GoRouterState state) =>
    const InvoiceScreen();
