import 'dart:convert';
import 'dart:io';

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

  static Future<dynamic> readJsonFile(String fileName) async {
    final jsonText = await File(fileName).readAsString();

    return json.decode(jsonText);
  }
}
