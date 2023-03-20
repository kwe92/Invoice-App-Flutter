import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/app.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/new_invoice.dart';

GoRouter _router = GoRouter(routes: <GoRoute>[
  GoRoute(path: '/', builder: _homePath, routes: <GoRoute>[
    GoRoute(
      path: 'newInvoice',
      builder: (context, state) => const NewInvoice(),
    )
  ]),
]);

void main() => runApp(MaterialApp.router(
      routerConfig: _router,
    ));

Widget _homePath(BuildContext context, GoRouterState state) => const MyApp();
