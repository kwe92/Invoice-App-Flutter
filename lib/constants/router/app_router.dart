import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/authentication/presentation/profile_screen.dart';
import 'package:invoiceapp/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/new_invoice.dart';
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
            InvoiceFormModel invoice = state.extra as InvoiceFormModel;
            print('From app_router: ${invoice.billToText}');
            return BaseScaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Edit Invoice Page'),
                    Gaps.gaph12,
                    ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text('Back'))
                  ],
                ),
              ),
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
