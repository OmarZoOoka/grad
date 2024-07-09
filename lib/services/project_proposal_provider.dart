import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProjectProposal with ChangeNotifier {
  String? token;
  List<dynamic>? proposalData;
  List? projectid;
  Future<void> projectgetproposal() async {
    print("list of idProject is $projectid");
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5140/api/ProjectProposal/1'),
        headers: <String, String>{
          'Authorization': 'Bearer ${token}',
        },
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        proposalData = responseData["result"];
        print(responseData);
        notifyListeners();
      } else {
        final responseData = jsonDecode(response.body);
        print(responseData['message']);
      }
    } catch (e) {
      throw Exception('Error fetching jobs: $e');
    }
  }
}
