import 'package:kiwi/kiwi.dart';
import 'package:sprightly/core/config/app_config.dart';
import 'package:sprightly/core/usecase.dart';
import 'package:sprightly/data/repositories/settings.dart' as globalRepo;
import 'package:sprightly/features/settings/domain/repositories/setting_repositories.dart';
import 'package:sprightly/features/settings/domain/usecases/get_settings.dart';

Future<void> initiate(
  KiwiContainer kiwiContainer, {
  String environment,
  AppConfig configurations,
}) async {
  // SettingsRepo settingsRepo = SettingsRepo(repoAppSettings);
  kiwiContainer.registerSingleton(
      (container) => SettingsRepo(container<globalRepo.SettingsRepo>()));

  kiwiContainer.registerSingleton(
      (container) => GetAppDetails(container<SettingsRepo>()));
  kiwiContainer.registerSingleton(
      (container) => GetAppSettings(container<SettingsRepo>()));

  final getAppDetails = kiwiContainer<GetAppDetails>();
  final appDetails = (await getAppDetails(NoParams())).fold((l) {
    throw l;
  }, (r) => r);
  if (null != appDetails)
    kiwiContainer.registerSingleton((container) => appDetails);

  final getAppSettings = kiwiContainer<GetAppSettings>();
  final appSettings = (await getAppSettings(NoParams())).fold((l) {
    throw l;
  }, (r) => r);
  if (null != appSettings)
    kiwiContainer.registerSingleton((container) => appSettings);
}
