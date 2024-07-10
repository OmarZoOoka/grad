import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProjectProposal with ChangeNotifier {
  String? token;
  List<dynamic>? proposalData;
  List? projectsid;
  Future<void> projectgetproposal() async {
    print("token is $token");
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
