import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:sprightly/utils/ready_or_not.dart';

void main() {
  ReadyMade readyMade;

  setUp(() {
    readyMade = ReadyMade();
  });

  tearDown(() {
    readyMade = null;
  });

  group('ReadyOrNot getReady() test', () {
    test('initiation test', () {
      // assert
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.ready, isFalse);
    });
    test('getReady() test', () async {
      // assert at begin
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.ready, isFalse);

      // act
      var result = readyMade.getReady();

      // assert after
      expect(result, isInstanceOf<Future<dynamic>>());
      expect(readyMade.dummy, isNull);
      expect(readyMade.timeRange, 0);
      expect(readyMade.ready, isFalse);
      // 1 second elapsed & still working
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.timeRange, 0);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & it's finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, 'dummy');
        expect(readyMade.timeRange.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.ready, isTrue);
      });
    });
    test('concurrent getReady() test', () async {
      // assert at begin
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.ready, isFalse);

      // act
      // triggered once
      readyMade.getReady();
      // triggered again & again
      var result1 = readyMade.getReady();
      var result2 = readyMade.getReady();

      // assert after
      expect(result1, isInstanceOf<Future<dynamic>>());
      expect(result2, isInstanceOf<Future<dynamic>>());
      expect(readyMade.dummy, isNull);
      expect(readyMade.timeRange, 0);
      expect(readyMade.ready, isFalse);
      // 1 second elapsed & still working
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.timeRange, 0);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & it's finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, 'dummy');
        expect(readyMade.timeRange.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.ready, isTrue);
      });
    });
  });

  group('ReadyOrNot triggerJob() test', () {
    test('initiation test', () {
      // assert
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, isNull);
      expect(readyMade.timeRange2, isNull);
      expect(readyMade.ready, isFalse);
    });
    test('triggerJob() test', () async {
      // assert at begin
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, isNull);
      expect(readyMade.timeRange2, isNull);
      expect(readyMade.ready, isFalse);

      // act
      var result1 = readyMade.triggerJob('job1');
      var result2 = readyMade.triggerJob('job2');

      // assert after
      expect(result1, isInstanceOf<FutureOr<dynamic>>());
      expect(result2, isInstanceOf<FutureOr<dynamic>>());
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, 0);
      expect(readyMade.timeRange2, 0);
      expect(readyMade.ready, isFalse);
      // 1 second elapsed & still working
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, isNull);
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange, isNull);
        expect(readyMade.timeRange1, 0);
        expect(readyMade.timeRange2, 0);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & job1's finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange, isNull);
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2, 0);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & both job1 and job2 are finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, 'dummy2');
        expect(readyMade.timeRange, isNull);
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2.toDouble(), moreOrLessEquals(3.0));
        expect(readyMade.ready, isFalse);
      });
    });
    test('triggerJob(), with getReady() test', () async {
      // assert at begin
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, isNull);
      expect(readyMade.timeRange2, isNull);
      expect(readyMade.ready, isFalse);

      // act
      var result = readyMade.getReady();
      var result1 = readyMade.triggerJob('job1');
      var result2 = readyMade.triggerJob('job2');

      // assert after
      expect(result, isInstanceOf<FutureOr<dynamic>>());
      expect(result1, isInstanceOf<FutureOr<dynamic>>());
      expect(result2, isInstanceOf<FutureOr<dynamic>>());
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, 0);
      expect(readyMade.timeRange1, 0);
      expect(readyMade.timeRange2, 0);
      expect(readyMade.ready, isFalse);
      // 1 second elapsed & still working
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, isNull);
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange, 0);
        expect(readyMade.timeRange1, 0);
        expect(readyMade.timeRange2, 0);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & getReady and job1 are finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, 'dummy');
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2, 0);
        expect(readyMade.ready, isTrue);
      });
      // another 1 second & both getReady and job1 and job2 are finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, 'dummy');
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, 'dummy2');
        expect(readyMade.timeRange.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2.toDouble(), moreOrLessEquals(3.0));
        expect(readyMade.ready, isTrue);
      });
    });
    test('triggerJob(), onReady: false test', () async {
      // assert at begin
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, isNull);
      expect(readyMade.timeRange2, isNull);
      expect(readyMade.ready, isFalse);

      // act
      var result1 = readyMade.triggerJob('job1', onReady: false);
      var result2 = readyMade.triggerJob('job2', onReady: false);

      // assert after
      expect(result1, isInstanceOf<FutureOr<dynamic>>());
      expect(result2, isInstanceOf<FutureOr<dynamic>>());
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, 0);
      expect(readyMade.timeRange2, 0);
      expect(readyMade.ready, isFalse);
      // 1 second elapsed & still working
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, isNull);
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange, isNull);
        expect(readyMade.timeRange1, 0);
        expect(readyMade.timeRange2, 0);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & job1's finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange, isNull);
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2, 0);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & both job1 and job2 are finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, 'dummy2');
        expect(readyMade.timeRange, isNull);
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2.toDouble(), moreOrLessEquals(3.0));
        expect(readyMade.ready, isFalse);
      });
    });
    test('triggerJob(), onReady: false with getReady() test', () async {
      // assert at begin
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, isNull);
      expect(readyMade.timeRange2, isNull);
      expect(readyMade.ready, isFalse);

      // act
      var result = readyMade.getReady();
      var result1 = readyMade.triggerJob('job1', onReady: false);
      var result2 = readyMade.triggerJob('job2', onReady: false);

      // assert after
      expect(result, isInstanceOf<FutureOr<dynamic>>());
      expect(result1, isInstanceOf<FutureOr<dynamic>>());
      expect(result2, isInstanceOf<FutureOr<dynamic>>());
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, 0);
      expect(readyMade.timeRange1, 0);
      expect(readyMade.timeRange2, 0);
      expect(readyMade.ready, isFalse);
      // 1 second elapsed & still working
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, isNull);
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange, 0);
        expect(readyMade.timeRange1, 0);
        expect(readyMade.timeRange2, 0);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & getReady and job1 are finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, 'dummy');
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2, 0);
        expect(readyMade.ready, isTrue);
      });
      // another 1 second & both getReady and job1 and job2 are finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, 'dummy');
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, 'dummy2');
        expect(readyMade.timeRange.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2.toDouble(), moreOrLessEquals(3.0));
        expect(readyMade.ready, isTrue);
      });
    });
    test('concurrent triggerJob() test', () async {
      // assert at begin
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, isNull);
      expect(readyMade.timeRange2, isNull);
      expect(readyMade.ready, isFalse);

      // act
      readyMade.triggerJob('job1');
      var result1_1 = readyMade.triggerJob('job1');
      var result1_2 = readyMade.triggerJob('job1');
      readyMade.triggerJob('job2');
      var result2_1 = readyMade.triggerJob('job2');
      var result2_2 = readyMade.triggerJob('job2');

      // assert after
      expect(result1_1, isInstanceOf<FutureOr<dynamic>>());
      expect(result1_2, isInstanceOf<FutureOr<dynamic>>());
      expect(result2_1, isInstanceOf<FutureOr<dynamic>>());
      expect(result2_2, isInstanceOf<FutureOr<dynamic>>());
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, 0);
      expect(readyMade.timeRange2, 0);
      expect(readyMade.ready, isFalse);
      // 1 second elapsed & still working
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, isNull);
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange, isNull);
        expect(readyMade.timeRange1, 0);
        expect(readyMade.timeRange2, 0);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & job1's finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange, isNull);
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2, 0);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & both job1 and job2 are finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, 'dummy2');
        expect(readyMade.timeRange, isNull);
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2.toDouble(), moreOrLessEquals(3.0));
        expect(readyMade.ready, isFalse);
      });
    });
    test('concurrent triggerJob(), onReady: false test', () async {
      // assert at begin
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, isNull);
      expect(readyMade.timeRange2, isNull);
      expect(readyMade.ready, isFalse);

      // act
      readyMade.triggerJob('job1', onReady: false);
      var result1_1 = readyMade.triggerJob('job1', onReady: false);
      var result1_2 = readyMade.triggerJob('job1', onReady: false);
      readyMade.triggerJob('job2');
      var result2_1 = readyMade.triggerJob('job2', onReady: false);
      var result2_2 = readyMade.triggerJob('job2', onReady: false);

      // assert after
      expect(result1_1, isInstanceOf<FutureOr<dynamic>>());
      expect(result1_2, isInstanceOf<FutureOr<dynamic>>());
      expect(result2_1, isInstanceOf<FutureOr<dynamic>>());
      expect(result2_2, isInstanceOf<FutureOr<dynamic>>());
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, 0);
      expect(readyMade.timeRange2, 0);
      expect(readyMade.ready, isFalse);
      // 1 second elapsed & still working
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, isNull);
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange, isNull);
        expect(readyMade.timeRange1, 0);
        expect(readyMade.timeRange2, 0);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & job1's finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange, isNull);
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2, 0);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & both job1 and job2 are finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, 'dummy2');
        expect(readyMade.timeRange, isNull);
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2.toDouble(), moreOrLessEquals(3.0));
        expect(readyMade.ready, isFalse);
      });
    });
    test('triggerJob(), onReady: true, immediate run test', () async {
      // assert at begin
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, isNull);
      expect(readyMade.timeRange2, isNull);
      expect(readyMade.ready, isFalse);

      // act
      readyMade.getReady();
      var result1 = readyMade.triggerJob('job1', onReady: true);
      var result2 = readyMade.triggerJob('job2', onReady: true);

      // assert after
      expect(result1, isInstanceOf<FutureOr<dynamic>>());
      expect(result2, isInstanceOf<FutureOr<dynamic>>());
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, 0);
      expect(readyMade.timeRange1, isNull);
      expect(readyMade.timeRange2, isNull);
      expect(readyMade.ready, isFalse);
      // 1 second elapsed & getReady working
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, isNull);
        expect(readyMade.dummy1, isNull);
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange, 0);
        expect(readyMade.timeRange1, isNull);
        expect(readyMade.timeRange2, isNull);
        expect(readyMade.ready, isFalse);
      });
      // another 1 second & getReady's finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy, 'dummy');
        expect(readyMade.dummy1, isNull);
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange1, isNull);
        expect(readyMade.timeRange2, isNull);
        expect(readyMade.ready, isTrue);
      });

      // act again
      var result1_2 = readyMade.triggerJob('job1', onReady: true);
      var result2_2 = readyMade.triggerJob('job2', onReady: true);

      // assert after 2nd run
      expect(result1_2, isInstanceOf<FutureOr<dynamic>>());
      expect(result2_2, isInstanceOf<FutureOr<dynamic>>());
      expect(readyMade.dummy, 'dummy');
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange.toDouble(), moreOrLessEquals(2.0));
      expect(readyMade.timeRange1, 0); // started
      expect(readyMade.timeRange2, 0); // started
      expect(readyMade.ready, isTrue);
      // 1 second elapsed & still working
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy1, isNull);
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange1, 0);
        expect(readyMade.timeRange2, 0);
      });
      // another 1 second & job1's finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2, 0);
      });
      // another 1 second & both job1 and job2 are finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, 'dummy2');
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2.toDouble(), moreOrLessEquals(3.0));
      });
    });
    test('triggerJob(), onReady: true, run after ready test', () async {
      // assert at begin
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, isNull);
      expect(readyMade.timeRange2, isNull);
      expect(readyMade.ready, isFalse);

      // act
      await readyMade.getReady();
      var result1 = readyMade.triggerJob('job1', onReady: true);
      var result2 = readyMade.triggerJob('job2', onReady: true);

      // assert after
      expect(result1, isInstanceOf<FutureOr<dynamic>>());
      expect(result2, isInstanceOf<FutureOr<dynamic>>());
      expect(readyMade.dummy, 'dummy');
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange.toDouble(), moreOrLessEquals(2.0));
      expect(readyMade.timeRange1, 0);
      expect(readyMade.timeRange2, 0);
      expect(readyMade.ready, isTrue);
      // 1 second elapsed & still working
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy1, isNull);
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange1, 0);
        expect(readyMade.timeRange2, 0);
      });
      // another 1 second & job1's finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2, 0);
      });
      // another 1 second & both job1 and job2 are finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, 'dummy2');
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2.toDouble(), moreOrLessEquals(3.0));
      });
    });
    test('concurrent triggerJob(), onReady: true, run after ready test',
        () async {
      // assert at begin
      expect(readyMade, isNotNull);
      expect(readyMade.dummy, isNull);
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange, isNull);
      expect(readyMade.timeRange1, isNull);
      expect(readyMade.timeRange2, isNull);
      expect(readyMade.ready, isFalse);

      // act
      await readyMade.getReady();
      readyMade.triggerJob('job1', onReady: true);
      var result1_1 = readyMade.triggerJob('job1', onReady: true);
      var result1_2 = readyMade.triggerJob('job1', onReady: true);
      readyMade.triggerJob('job2', onReady: true);
      var result2_1 = readyMade.triggerJob('job2', onReady: true);
      var result2_2 = readyMade.triggerJob('job2', onReady: true);

      // assert after
      expect(result1_1, isInstanceOf<FutureOr<dynamic>>());
      expect(result1_2, isInstanceOf<FutureOr<dynamic>>());
      expect(result2_1, isInstanceOf<FutureOr<dynamic>>());
      expect(result2_2, isInstanceOf<FutureOr<dynamic>>());
      expect(readyMade.dummy, 'dummy');
      expect(readyMade.dummy1, isNull);
      expect(readyMade.dummy2, isNull);
      expect(readyMade.timeRange.toDouble(), moreOrLessEquals(2.0));
      expect(readyMade.timeRange1, 0);
      expect(readyMade.timeRange2, 0);
      expect(readyMade.ready, isTrue);
      // 1 second elapsed & still working
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy1, isNull);
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange1, 0);
        expect(readyMade.timeRange2, 0);
      });
      // another 1 second & job1's finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, isNull);
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2, 0);
      });
      // another 1 second & both job1 and job2 are finished
      await Future.delayed(Duration(seconds: 1)).then((_) {
        expect(readyMade.dummy1, 'dummy1');
        expect(readyMade.dummy2, 'dummy2');
        expect(readyMade.timeRange1.toDouble(), moreOrLessEquals(2.0));
        expect(readyMade.timeRange2.toDouble(), moreOrLessEquals(3.0));
      });
    });
  });
}

// dummy class for testing
class ReadyMade with ReadyOrNotMixin {
  String dummy;
  String dummy1;
  String dummy2;
  int timeRange;
  int timeRange1;
  int timeRange2;

  ReadyMade() {
    super.getReadyWorker = _getReady;
    super.additionalSingleJobs['job1'] = _additionalJob1;
    super.additionalSingleJobs['job2'] = _additionalJob2;
  }

  Future _getReady() {
    timeRange = 0;
    var timeNow = DateTime.now();
    return Future.delayed(Duration(seconds: 2)).then((_) {
      dummy = 'dummy';
      timeRange = DateTime.now().difference(timeNow).inSeconds;
    });
  }

  Future _additionalJob1() {
    timeRange1 = 0;
    var timeNow = DateTime.now();
    return Future.delayed(Duration(seconds: 2)).then((_) {
      dummy1 = 'dummy1';
      timeRange1 = DateTime.now().difference(timeNow).inSeconds;
    });
  }

  Future _additionalJob2() {
    timeRange2 = 0;
    var timeNow = DateTime.now();
    return Future.delayed(Duration(seconds: 3)).then((_) {
      dummy2 = 'dummy2';
      timeRange2 = DateTime.now().difference(timeNow).inSeconds;
    });
  }
}
