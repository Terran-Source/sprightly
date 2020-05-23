import 'package:dartz/dartz.dart';
import 'package:sprightly/core/usecase.dart';
import 'package:sprightly/features/settings/domain/entities/setting_entities.dart';
import 'package:sprightly/features/settings/domain/repositories/setting_repositories.dart';
import 'package:sprightly/utils/dartz_execution.dart';
import 'package:sprightly/utils/formatted_exception.dart';

class GetAppDetails extends UseCase<AppDetails, NoParams> {
  final SettingsRepo _repo;

  GetAppDetails(this._repo);

  @override
  Future<Either<FormattedException, AppDetails>> call(NoParams noParams) =>
      DartzExecution.call<AppDetails>(_repo.appDetails,
          moduleName: 'GetAppDetails');
}

class GetAppSettings extends UseCase<AppSettings, NoParams> {
  final SettingsRepo _repo;
  GetAppSettings(this._repo);

  @override
  Future<Either<FormattedException, AppSettings>> call(NoParams noParams) =>
      DartzExecution.call<AppSettings>(_repo.appSettings,
          moduleName: 'GetAppSettings');
}
