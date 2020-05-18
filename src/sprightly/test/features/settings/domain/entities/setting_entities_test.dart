import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprightly/features/settings/domain/entities/setting_entities.dart';
import 'package:sprightly/models/constants/enums.dart';
import 'package:sprightly/models/repositories/settings.dart' as db;

class MockDbAppSettings extends Mock implements db.AppSettings {}

MockDbAppSettings mockSettings;

void main() {
  testAppDetails();
  testAppSettings();
}

void testAppDetails() {
  AppDetails entity;
  group('test AppDetails', () {
    setUp(() {
      mockSettings = MockDbAppSettings();
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
    });
    test('singleton instance', () {
      // re-arrange
      reset(mockSettings);
      final anotherEntity = AppDetails.fromDB(mockSettings);

      // assert
      expect(entity, anotherEntity);
    });
  });
}

void testAppSettings() {
  AppSettings entity;
  group('test AppSettings', () {
    setUp(() {
      mockSettings = MockDbAppSettings();
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
    });
    test('singleton instance', () {
      // act
      final anotherEntity = AppSettings.fromDB(mockSettings);

      // assert
      expect(entity, anotherEntity);
    });
  });
}
