import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_project/Components/flush_bar.dart';
import 'package:graduation_project/screens/freelancer_home_screen.dart';
import 'package:http/http.dart' as http;

class JobProposal with ChangeNotifier {
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? token;

  Future<void> postJob(BuildContext context,
      {required String token, required int projectId}) async {
    try {
      int price = int.tryParse(priceController.text) ?? 0; // Convert to int

      final response = await http.post(
        Uri.parse('http://10.0.2.2:5140/api/ProjectProposal/$projectId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          "price": price,
          "deliverDate": dateController.text,
          "description": descriptionController.text
        }),
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );

        showFlushBar('Proposal Sent Successfully', isError: false);
      } else {
        showFlushBar('Failed to send proposal. Please try again.',
            isError: true);
      }
    } catch (e) {
      print('Something went wrong: $e');
      showFlushBar('Error: $e', isError: true);
    }
  }
}
