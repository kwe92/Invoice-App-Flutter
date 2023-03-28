import 'package:get_it/get_it.dart';
import 'package:invoiceapp/constants/router/app_router.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.pushNewScope();
}
