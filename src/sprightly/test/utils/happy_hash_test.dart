import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sprightly/utils/happy_hash.dart';

void main() {
  String libraryName;
  bool isHmac;
  String item = WordPair.random().asString;
  List<String> items =
      List<String>.generate(10, (i) => WordPair.random().asString);
  var hashLengths =
      List<int>.generate(4, (i) => Random.secure().nextInt(pow(10, i)));

  HashLibrary.values.forEach((library) {
    libraryName = library.toString().split('.').last;
    isHmac = libraryName.startsWith('hmac_');
    final prefix = library.toString().split(".").last.replaceAll("_", "") + ':';

    group('happy hash: library: $libraryName', () {
      if (!isHmac) {
        test('hashed(): Consistency check', () {
          // act
          var result1 = hashed(item, library: library);
          var result2 = hashed(item, library: library);

          // assert
          expect(result1, result2);
        });
        test('hashed(): length check', () {
          hashLengths.forEach((hashLength) {
            print('check with length: $hashLength');
            // act
            var result = hashed(item, hashLength: hashLength, library: library);

            // assert
            expect(result.length, hashLength);
          });
        });

        test('hashedAll(): Consistency check', () {
          // act
          var result1 = hashedAll(items, library: library);
          var result2 = hashedAll(items, library: library);

          // assert
          expect(result1, result2);
        });
        test('hashedAll(): length check', () {
          hashLengths.forEach((hashLength) {
            // act
            var result =
                hashedAll(items, hashLength: hashLength, library: library);

            // assert
            expect(result.length, hashLength);
          });
        });
      } else {
        group('With key', () {
          var key = 'k4q2d8CRLDXpxfBPic6xGkqCnm7Bk2bi9S2G7cB0eQTR3'
              'SE15ap789aUcdqbI5tXfv+H0bxsHxTtCYhWwd3I27fcPJ'
              '9MGOnUF6ukr/Mjt/4y+6v+qUuqvqowLFlXal1kLsE2Q2H'
              'GyUzCPeiWZUuih9XyA9rbMRditEgmp3/+jJzjIPu0juwx'
              'NXFiw/TnZroLeGTiyod1u54qRRi9EhYgIJAtV0iOQbrYj'
              'Ujm31Z80hRrHO/eX2DKgB55XKZY+AQbGS5zKXntlA6war'
              'mcR2bGfbRct0ZBIq92PvRDfKcSR9tlM7/JPNX99uiXLCQ'
              'uHqsh5Ys4JvLBfqOv4bmI7SX+al5fiTmCermTFnmV9IU3'
              'DgYq3rUb46TxeQBpWoF7LjmQ52af0F5ZwqeFLjADB4jE8'
              'uIt+Scj1qaIBBE87gq16sWs1ig6DGhBkanS52LMWU/jG5'
              'pnkOjtZ/CA/ykYNAlV6rEAhH1FUhY/wT+pKJ9lf4/2BbF'
              '+MF0mGJcZ2hjiaef8nGTK5v3h5j42N3gonv26lDmRXOxA'
              'P3XDs7esVNqonHsI1XAdVYRun';

          test('hashed(): Consistency check', () {
            // act
            var result1 = hashed(item, library: library, key: key);
            var result2 = hashed(item, library: library, key: key);

            // assert
            expect(result1, result2);
          });
          test('hashed(): length check', () {
            hashLengths.forEach((hashLength) {
              print('check with length: $hashLength');
              // act
              var result = hashed(item,
                  hashLength: hashLength, library: library, key: key);

              // assert
              expect(result.length, hashLength);
            });
          });

          test('hashedAll(): Consistency check', () {
            // act
            var result1 = hashedAll(items, library: library, key: key);
            var result2 = hashedAll(items, library: library, key: key);

            // assert
            expect(result1, result2);
          });
          test('hashedAll(): length check', () {
            hashLengths.forEach((hashLength) {
              // act
              var result = hashedAll(items,
                  hashLength: hashLength, library: library, key: key);

              // assert
              expect(result.length, hashLength);
            });
          });
        });
        group('Without key: should not Consistently match', () {
          test('hashed(): Consistency `No Match` check', () {
            // act
            var result1 = hashed(item, library: library);
            var result2 = hashed(item, library: library);

            // assert
            expect(result1, isNot(result2));
          });
          test('hashed(): length check', () {
            hashLengths.forEach((hashLength) {
              // act
              var result =
                  hashed(item, hashLength: hashLength, library: library);

              // assert
              expect(result.length, hashLength);
            });
          });

          test('hashedAll(): Consistency `No Match` check', () {
            // act
            var result1 = hashedAll(items, library: library);
            var result2 = hashedAll(items, library: library);

            // assert
            expect(result1, isNot(result2));
          });
          test('hashedAll(): length check', () {
            hashLengths.forEach((hashLength) {
              // act
              var result =
                  hashedAll(items, hashLength: hashLength, library: library);

              // assert
              expect(result.length, hashLength);
            });
          });
        });
      }
      test('hashed(): prefixLibrary check', () {
        // act
        final resultWith = hashed(item, library: library);
        final resultWithout =
            hashed(item, library: library, prefixLibrary: false);

        // assert
        expect(resultWith.startsWith(prefix), isTrue);
        expect(resultWithout.startsWith(prefix), isFalse);
      });
      test('hashedAll(): prefixLibrary check', () {
        // act
        final resultWith = hashedAll(items, library: library);
        final resultWithout =
            hashedAll(items, library: library, prefixLibrary: false);

        // assert
        expect(resultWith.startsWith(prefix), isTrue);
        expect(resultWithout.startsWith(prefix), isFalse);
      });
    });
  });
  group('happy hash: randomString()', () {
    test('check with default length', () {
      print('check with length: 16');
      // arrange & act
      final count = 50;
      final hashLength = 16;
      final result = List<String>.generate(count, (index) => randomString());
      final set = Set<String>.from(result);
      print('sample: ${result[0]}');

      // assert
      expect(result.length, set.length);
      set.forEach((element) {
        expect(element.length, hashLength);
      });
    });
    hashLengths.forEach((hashLength) {
      test('check with length', () {
        print('check with length: $hashLength');
        // arrange & act
        final count = 50;
        final result =
            List<String>.generate(count, (index) => randomString(hashLength));
        final set = Set<String>.from(result);
        print('sample: ${result[0]}');

        // assert
        if (hashLength == 0) {
          expect(result.length, count);
          expect(set.length, 1);
        } else {
          expect(result.length, set.length);
        }
        set.forEach((element) {
          expect(element.length, hashLength);
        });
      });
    });
    test('check with really long length', () {
      print('check with length: 4096');
      // arrange & act
      final count = 50;
      final hashLength = 4096;
      final result =
          List<String>.generate(count, (index) => randomString(hashLength));
      final set = Set<String>.from(result);
      print('sample: ${result[0]}');

      // assert
      expect(result.length, set.length);
      set.forEach((element) {
        expect(element.length, hashLength);
      });
    });
  });
}
