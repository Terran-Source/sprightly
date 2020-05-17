library sprightly.crypto;

import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

enum HashLibrary {
  md5,
  sha1,
  sha224,
  sha256,
  sha384,
  sha512,
  hmac_md5,
  hmac_sha1,
  hmac_sha224,
  hmac_sha256,
  hmac_sha384,
  hmac_sha512
}

String hashedAll(
  List<String> items, {
  int hashLength = 16,
  HashLibrary library = HashLibrary.sha1,
  String key,
}) {
  key ??= (Random().nextInt(1000000000) + DateTime.now().millisecondsSinceEpoch)
      .toString();
  final utf8Key = utf8.encode(key);
  final sink = AccumulatorSink<Digest>();
  final byteChunks = items.map((str) => utf8.encode(str));
  ByteConversionSink chunks;
  switch (library) {
    case HashLibrary.md5:
      chunks = md5.startChunkedConversion(sink);
      break;
    case HashLibrary.sha224:
      chunks = sha224.startChunkedConversion(sink);
      break;
    case HashLibrary.sha256:
      chunks = sha256.startChunkedConversion(sink);
      break;
    case HashLibrary.sha384:
      chunks = sha384.startChunkedConversion(sink);
      break;
    case HashLibrary.sha512:
      chunks = sha512.startChunkedConversion(sink);
      break;
    case HashLibrary.hmac_md5:
      final hmac = Hmac(md5, utf8Key);
      chunks = hmac.startChunkedConversion(sink);
      break;
    case HashLibrary.hmac_sha1:
      final hmac = Hmac(sha1, utf8Key);
      chunks = hmac.startChunkedConversion(sink);
      break;
    case HashLibrary.hmac_sha224:
      final hmac = Hmac(sha224, utf8Key);
      chunks = hmac.startChunkedConversion(sink);
      break;
    case HashLibrary.hmac_sha256:
      final hmac = Hmac(sha256, utf8Key);
      chunks = hmac.startChunkedConversion(sink);
      break;
    case HashLibrary.hmac_sha384:
      final hmac = Hmac(sha384, utf8Key);
      chunks = hmac.startChunkedConversion(sink);
      break;
    case HashLibrary.hmac_sha512:
      final hmac = Hmac(sha512, utf8Key);
      chunks = hmac.startChunkedConversion(sink);
      break;
    case HashLibrary.sha1:
    default:
      chunks = sha1.startChunkedConversion(sink);
      break;
  }
  byteChunks.forEach((bt) => chunks.add(bt));
  chunks.close();
  var result = "${library.toString().split(".").last.replaceAll("_", "")}"
      ":${sink.events.single}";
  if (null == hashLength) return result;
  if (result.length < hashLength) {
    final repeater = hashed(result + key, hashLength: null, library: library);
    while (result.length < hashLength) result += repeater;
  }
  return result.substring(0, hashLength);
}

String hashed(
  String item, {
  int hashLength = 16,
  HashLibrary library = HashLibrary.sha1,
  String key,
}) =>
    hashedAll(
      [item],
      hashLength: hashLength,
      library: library,
      key: key,
    );
