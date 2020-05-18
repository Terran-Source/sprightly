import 'package:dartz/dartz.dart';
import 'package:sprightly/core/dartz_execution.dart';
import 'package:sprightly/core/formatted_exception.dart';
import 'package:sprightly/core/usecase.dart';
import 'package:sprightly/features/settings/domain/entities/setting-entities.dart';
import 'package:sprightly/features/settings/domain/repositories/setting-repositories.dart';

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
