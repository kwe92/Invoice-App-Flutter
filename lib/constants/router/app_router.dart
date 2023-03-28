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
