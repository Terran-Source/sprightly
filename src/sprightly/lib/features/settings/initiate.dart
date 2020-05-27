import 'package:kiwi/kiwi.dart';
import 'package:sprightly/core/usecase.dart';
import 'package:sprightly/data/repositories/settings.dart' as globalRepo;
import 'package:sprightly/features/settings/domain/repositories/setting_repositories.dart';
import 'package:sprightly/features/settings/domain/usecases/get_settings.dart';

Future<void> initiate(
  Container container, {
  String environment,
  Map<String, dynamic> configurations = const {},
}) async {
  // SettingsRepo settingsRepo = SettingsRepo(repoAppSettings);
  container.registerSingleton(
      (container) => SettingsRepo(container<globalRepo.SettingsRepo>()));

  container.registerSingleton(
      (container) => GetAppDetails(container<SettingsRepo>()));
  container.registerSingleton(
      (container) => GetAppSettings(container<SettingsRepo>()));

  final getAppDetails = container<GetAppDetails>();
  final appDetails = (await getAppDetails(NoParams())).fold((l) {
    throw l;
  }, (r) => r);
  if (null != appDetails)
    container.registerSingleton((container) => appDetails);

  final getAppSettings = container<GetAppSettings>();
  final appSettings = (await getAppSettings(NoParams())).fold((l) {
    throw l;
  }, (r) => r);
  if (null != appSettings)
    container.registerSingleton((container) => appSettings);
}
