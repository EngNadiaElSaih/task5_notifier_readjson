import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/modem.dart';

Future<List<Item>> readJson() async {
  final String response = await rootBundle.loadString('assets/data.json');
  final data = await json.decode(response);
  return (data['items'] as List).map((item) => Item.fromJson(item)).toList();
}
