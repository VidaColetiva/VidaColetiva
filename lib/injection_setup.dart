import 'package:get_it/get_it.dart';
import 'package:vidacoletiva/data/repositories/event_repository.dart';
import 'package:vidacoletiva/data/repositories/google_drive_repository.dart';
import 'package:vidacoletiva/data/repositories/user_repository.dart';
import 'package:vidacoletiva/data/services/event_service.dart';
import 'package:vidacoletiva/data/services/login_service.dart';

final getIt = GetIt.instance;

Future initilizeDependencies() async {
  getIt.registerSingleton(UserRepository());
  getIt.registerSingleton<EventRepository>(EventRepository());
  
  getIt.registerSingleton<LoginService>(LoginService(getIt.get()));

  getIt.registerLazySingleton<GoogleDriveRepository>(
      () => GoogleDriveRepository(getIt.get<LoginService>().authClient!));

  getIt.registerSingleton<EventService>(
      EventService(getIt.get<EventRepository>()));
}
