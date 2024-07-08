import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_project/Components/flush_bar.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:http/http.dart' as http;

class JobProvider with ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController monthsController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  List? jobsData;
  String ?token ;
  Future<void> postJob(context,
      {required int categoryId,
      required List<int> skillsListId,
      required token}) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5140/api/Project'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}'
        },
        body: jsonEncode({
          "title": "${titleController.text}",
          "description": "${descController.text}",
          "categoryId": categoryId,
          "requiredSkillsId": skillsListId,
          "expectedDuration": {
            "months": "${int.parse(monthsController.text)}",
            "days": "${int.parse(daysController.text)}"
          },
          "expectedBudget": "${int.parse(budgetController.text)}"
        }),
      );
      print(token);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final statusCode = responseData['statusCode'];
        Navigator.pop(context);
        showFlushBar('Job Posted Successfully', isError: false);
      }
    } catch (e) {
      print('Something went wrong: $e');
    }
  }

  Future<void> fetchJobs() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5140/api/Project'),
        headers: <String, String>{'Authorization': 'Bearer ${token}'},
      );
      print(response.body);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        jobsData = responseData["result"];
        print(jobsData);
        notifyListeners();
      } else {
        final responseData = jsonDecode(response.body);
        print(responseData['message']);
      }
    } catch (e) {
      throw Exception('Error fetching skills: $e');
    }
  }
}
