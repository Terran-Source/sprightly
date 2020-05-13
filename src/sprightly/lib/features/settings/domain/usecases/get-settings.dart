import 'package:dartz/dartz.dart';
import 'package:sprightly/core/dartz_execution.dart';
import 'package:sprightly/core/formatted_exception.dart';
import 'package:sprightly/features/settings/domain/entities/setting-entities.dart';
import 'package:sprightly/features/settings/domain/repositories/setting-repositories.dart';

class GetSettings {
  final SettingsRepo _repo;

  GetSettings(this._repo);

  Future<Either<FormattedException, AppDetails>> getAppDetails() =>
      DartzExecution.call<AppDetails>(() => _repo.appDetails,
          moduleName: 'GetSettings.getAppDetails');
  Future<Either<FormattedException, AppSettings>> getAppSettings() =>
      DartzExecution.call<AppSettings>(() => _repo.appSettings,
          moduleName: 'GetSettings.getAppSettings');
}
