import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../global/variables.dart';
import '../service/api_paladins_hirez.dart';

class UtilsFunctions {
  static Future<void> createSession() async {
    var response = await ApiPaladinsHirez.createSession();
    if (response != null) {
      GlobalsVariables.sessionId = response;
    }
  }

  static Widget customLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static String getMD5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }

  static String getSignature({required String path}) {
    var signature =
        '${GlobalsVariables.devKey}$path${GlobalsVariables.authKey}${DateFormat('yyyyMMddHHmmss').format(DateTime.now().toUtc())}';
    return UtilsFunctions.getMD5(signature);
  }

  static String getTimestamp() {
    return DateFormat('yyyyMMddHHmmss').format(DateTime.now().toUtc());
  }
}
