import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprightly/core/usecase.dart';
import 'package:sprightly/features/settings/domain/entities/setting-entities.dart';
import 'package:sprightly/features/settings/domain/repositories/setting-repositories.dart';
import 'package:sprightly/features/settings/domain/usecases/get-settings.dart';
import 'package:sprightly/models/constants/enums.dart';

class MockAppDetails extends Mock implements AppDetails {}

class MockAppSettings extends Mock implements AppSettings {}

class MockSettingsRepo extends Mock implements SettingsRepo {}

MockSettingsRepo mockRepo;

void main() {
  testGetAppDetails();
  testGetAppSettings();
}

void testGetAppDetails() {
  GetAppDetails useCase;

  group('GetAppDetails check', () {
    setUp(() {
      mockRepo = MockSettingsRepo();
      useCase = GetAppDetails(mockRepo);
    });

    tearDown(() {
      reset(mockRepo);
    });

    test('GetAppDetails returns correct AppDetails', () async {
      // arrange
      MockAppDetails _mockAppDetails = MockAppDetails();
      when(_mockAppDetails.appName).thenReturn('Sprightly');
      when(_mockAppDetails.packageName).thenReturn('com.marganam.sprightly');
      when(_mockAppDetails.version).thenReturn('1.0.0');
      when(_mockAppDetails.buildNumber).thenReturn('100');
      when(_mockAppDetails.dbVersion).thenReturn(1);

      when(mockRepo.appDetails()).thenReturn(_mockAppDetails);

      // act
      var result = await useCase(NoParams());

      // assert
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(_mockAppDetails));
      // Verify that the method has been called on the Repository
      verify(mockRepo.appDetails());
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockRepo);
    });
  });
}

void testGetAppSettings() {
  GetAppSettings useCase;

  group('GetAppSettings check', () {
    setUp(() {
      mockRepo = MockSettingsRepo();
      useCase = GetAppSettings(mockRepo);
    });

    tearDown(() {
      reset(mockRepo);
    });

    test('GetAppSettings returns correct AppSettings', () async {
      // arrange
      MockAppSettings _mockAppSettings = MockAppSettings();
      when(_mockAppSettings.environment).thenReturn('Prod');
      when(_mockAppSettings.debug).thenReturn(false);
      when(_mockAppSettings.primarySetupComplete).thenReturn(true);
      when(_mockAppSettings.themeMode).thenReturn(ThemeMode.Dark);

      when(mockRepo.appSettings()).thenReturn(_mockAppSettings);

      // act
      var result = await useCase(NoParams());

      // assert
      expect(result, Right(_mockAppSettings));
      verify(mockRepo.appSettings());
      verifyNoMoreInteractions(mockRepo);
    });
  });
}
