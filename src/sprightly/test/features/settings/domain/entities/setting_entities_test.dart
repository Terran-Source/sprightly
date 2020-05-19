import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprightly/features/settings/domain/entities/setting_entities.dart';
import 'package:sprightly/data/constants/enums.dart';
import 'package:sprightly/data/repositories/settings.dart' as db;

class MockDbAppSettings extends Mock implements db.AppSettings {}

MockDbAppSettings mockSettings = MockDbAppSettings();

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
      when(mockSettings.appName).thenReturn('Sprightly');
      when(mockSettings.packageName).thenReturn('com.marganam.sprightly');
      when(mockSettings.version).thenReturn('1.0.0');
      when(mockSettings.buildNumber).thenReturn('100');
      when(mockSettings.dbVersion).thenReturn(1);

      // act
      entity = AppDetails.fromDB(mockSettings);
    });
    tearDown(() {
      reset(mockSettings);
    });
    test('success', () {
      // assert
      expect(entity, isA<AppDetails>());
      expect(entity.appName, 'Sprightly');
      expect(entity.packageName, 'com.marganam.sprightly');
      expect(entity.version, '1.0.0');
      expect(entity.buildNumber, '100');
      expect(entity.dbVersion, 1);
      verify(mockSettings.appName);
      verify(mockSettings.packageName);
      verify(mockSettings.version);
      verify(mockSettings.buildNumber);
      verify(mockSettings.dbVersion);
    });
    test('singleton instance', () {
      // re-arrange
      reset(mockSettings);
      final anotherEntity = AppDetails.fromDB(mockSettings);

      // assert
      expect(entity, anotherEntity);
      verifyNever(mockSettings.appName);
      verifyNever(mockSettings.packageName);
      verifyNever(mockSettings.version);
      verifyNever(mockSettings.buildNumber);
      verifyNever(mockSettings.dbVersion);
    });
  });
}

void testAppSettings() {
  AppSettings entity;
  group('test AppSettings', () {
    setUp(() {
      entity = AppSettings.fromDB(mockSettings);
    });
    tearDown(() {
      reset(mockSettings);
    });
    test('success', () {
      // arrange
      when(mockSettings.environment).thenReturn('Test');
      when(mockSettings.debug).thenReturn(false);
      when(mockSettings.primarySetupComplete).thenReturn(false);
      when(mockSettings.themeMode).thenReturn(ThemeMode.Dark);

      // assert
      expect(entity, isA<AppSettings>());
      expect(entity.environment, 'Test');
      expect(entity.debug, false);
      expect(entity.primarySetupComplete, false);
      expect(entity.themeMode, ThemeMode.Dark);
      verify(mockSettings.environment);
      verify(mockSettings.debug);
      verify(mockSettings.primarySetupComplete);
      verify(mockSettings.themeMode);
    });
    test('singleton instance', () {
      // act
      final anotherEntity = AppSettings.fromDB(mockSettings);

      // assert
      expect(entity, anotherEntity);
      verifyNever(mockSettings.environment);
      verifyNever(mockSettings.debug);
      verifyNever(mockSettings.primarySetupComplete);
      verifyNever(mockSettings.themeMode);
    });
    group('setter test', () {
      test('set debug', () {
        // act
        entity.debug = true;

        // assert
        verify(mockSettings.debug = true);
        verifyNever(mockSettings.environment);
        verifyNever(mockSettings.primarySetupComplete = any);
        verifyNever(mockSettings.themeMode = any);
      });
      test('set primarySetupComplete', () {
        // act
        entity.primarySetupComplete = true;

        // assert
        verify(mockSettings.primarySetupComplete = true);
        verifyNever(mockSettings.environment);
        verifyNever(mockSettings.debug = any);
        verifyNever(mockSettings.themeMode = any);
      });
      test('set themeMode', () {
        // act
        entity.themeMode = ThemeMode.Bright;

        // assert
        verify(mockSettings.themeMode = any);
        verifyNever(mockSettings.environment);
        verifyNever(mockSettings.debug = any);
        verifyNever(mockSettings.primarySetupComplete = any);
      });
    });
  });
}
