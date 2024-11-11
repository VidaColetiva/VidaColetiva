import 'package:get_it/get_it.dart';
import 'package:vidacoletiva/data/services/google_drive_service.dart';
import 'package:vidacoletiva/data/services/login_service.dart';

final getIt = GetIt.instance;

Future initilizeDependencies() async {
  getIt.registerSingleton<LoginService>(LoginService());

  getIt.registerLazySingleton<GoogleDriveService>(() => GoogleDriveService(getIt.get<LoginService>().authClient!));
}