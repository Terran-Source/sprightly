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
  var hashLengths = List<int>.generate(4, (i) => Random().nextInt(pow(10, i)));

  HashLibrary.values.forEach((library) {
    libraryName = library.toString().split('.').last;
    isHmac = libraryName.startsWith('hmac_');

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
          var key = (Random().nextInt(1000000000) +
                  DateTime.now().millisecondsSinceEpoch)
              .toString();

          test('hashed(): Consistency check', () {
            // act
            var result1 = hashed(item, library: library, key: key);
            var result2 = hashed(item, library: library, key: key);

            // assert
            expect(result1, result2);
          });
          test('hashed(): length check', () {
            hashLengths.forEach((hashLength) {
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
    });
  });
}
