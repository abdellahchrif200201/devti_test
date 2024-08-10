import 'dart:convert'; // For jsonDecode
import 'package:devti_test/models/NotModel.dart';
import 'package:flutter/services.dart'; // For rootBundle

// Function to load the JSON data from the assets
Future<List<NotModel>> loadNotModels() async {
  // Load the JSON file from the assets
  final String response = await rootBundle.loadString('assets/json/not.json');

  // Decode the JSON into a List<dynamic>
  final List<dynamic> data = jsonDecode(response);

  // Convert the List<dynamic> into a List<NotModel>
  return data.map((json) => NotModel.fromJson(json)).toList();
}
