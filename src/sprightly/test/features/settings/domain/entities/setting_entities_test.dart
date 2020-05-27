import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprightly/features/settings/domain/entities/setting_entities.dart';
import 'package:sprightly/data/constants/enums.dart';
import 'package:sprightly/data/repositories/settings.dart';

class MockGlobalSettingsRepo extends Mock implements SettingsRepo {}

MockGlobalSettingsRepo mockSettingsRepo = MockGlobalSettingsRepo();

void main() {
  testAppDetails();
  testAppSettings();
}

void testAppDetails() {
  AppDetails entity;
  group('test AppDetails', () {
    setUp(() {
      //mockSettings = MockDbAppSettings();
      // arrange
      when(mockSettingsRepo.appName).thenReturn('Sprightly');
      when(mockSettingsRepo.packageName).thenReturn('com.marganam.sprightly');
      when(mockSettingsRepo.version).thenReturn('1.0.0');
      when(mockSettingsRepo.buildNumber).thenReturn('100');
      when(mockSettingsRepo.dbVersion).thenReturn(1);

      // act
      entity = AppDetails.fromDB(mockSettingsRepo);
    });
    tearDown(() {
      reset(mockSettingsRepo);
    });
    test('success', () {
      // assert
      expect(entity, isA<AppDetails>());
      expect(entity.appName, 'Sprightly');
      expect(entity.packageName, 'com.marganam.sprightly');
      expect(entity.version, '1.0.0');
      expect(entity.buildNumber, '100');
      expect(entity.dbVersion, 1);
      verify(mockSettingsRepo.appName);
      verify(mockSettingsRepo.packageName);
      verify(mockSettingsRepo.version);
      verify(mockSettingsRepo.buildNumber);
      verify(mockSettingsRepo.dbVersion);
    });
    test('singleton instance', () {
      // re-arrange
      reset(mockSettingsRepo);
      final anotherEntity = AppDetails.fromDB(mockSettingsRepo);

      // assert
      expect(entity, anotherEntity);
      verifyNever(mockSettingsRepo.appName);
      verifyNever(mockSettingsRepo.packageName);
      verifyNever(mockSettingsRepo.version);
      verifyNever(mockSettingsRepo.buildNumber);
      verifyNever(mockSettingsRepo.dbVersion);
    });
  });
}

void testAppSettings() {
  AppSettings entity;
  group('test AppSettings', () {
    setUp(() {
      entity = AppSettings.fromDB(mockSettingsRepo);
    });
    tearDown(() {
      reset(mockSettingsRepo);
    });
    test('success', () {
      // arrange
      when(mockSettingsRepo.environment).thenReturn('Test');
      when(mockSettingsRepo.debug).thenReturn(false);
      when(mockSettingsRepo.primarySetupComplete).thenReturn(false);
      when(mockSettingsRepo.themeMode).thenReturn(ThemeMode.Dark);

      // assert
      expect(entity, isA<AppSettings>());
      expect(entity.environment, 'Test');
      expect(entity.debug, false);
      expect(entity.primarySetupComplete, false);
      expect(entity.themeMode, ThemeMode.Dark);
      verify(mockSettingsRepo.environment);
      verify(mockSettingsRepo.debug);
      verify(mockSettingsRepo.primarySetupComplete);
      verify(mockSettingsRepo.themeMode);
    });
    test('singleton instance', () {
      // act
      final anotherEntity = AppSettings.fromDB(mockSettingsRepo);

      // assert
      expect(entity, anotherEntity);
      verifyNever(mockSettingsRepo.environment);
      verifyNever(mockSettingsRepo.debug);
      verifyNever(mockSettingsRepo.primarySetupComplete);
      verifyNever(mockSettingsRepo.themeMode);
    });
    group('setter test', () {
      test('set debug', () {
        // act
        entity.debug = true;

        // assert
        verify(mockSettingsRepo.debug = true);
        verifyNever(mockSettingsRepo.environment);
        verifyNever(mockSettingsRepo.primarySetupComplete = any);
        verifyNever(mockSettingsRepo.themeMode = any);
      });
      test('set primarySetupComplete', () {
        // act
        entity.primarySetupComplete = true;

        // assert
        verify(mockSettingsRepo.primarySetupComplete = true);
        verifyNever(mockSettingsRepo.environment);
        verifyNever(mockSettingsRepo.debug = any);
        verifyNever(mockSettingsRepo.themeMode = any);
      });
      test('set themeMode', () {
        // act
        entity.themeMode = ThemeMode.Bright;

        // assert
        verify(mockSettingsRepo.themeMode = any);
        verifyNever(mockSettingsRepo.environment);
        verifyNever(mockSettingsRepo.debug = any);
        verifyNever(mockSettingsRepo.primarySetupComplete = any);
      });
    });
  });
}
