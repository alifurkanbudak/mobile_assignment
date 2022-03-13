import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FileHelpers {
  static Future<dynamic> readJsonAsset(
    String fileName, {
    bool useIsolate = false,
  }) async {
    final jsonText = await rootBundle.loadString(fileName);

    if (useIsolate) {
      return compute(json.decode, jsonText);
    } else {
      return json.decode(jsonText);
    }
  }
}
