import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;

extension Encryption on String {
  String get sha1 => crypto.sha1.convert(utf8.encode(this)).toString();
}