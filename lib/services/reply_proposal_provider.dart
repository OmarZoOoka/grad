import 'package:flutter/material.dart';
import 'package:graduation_project/Components/flush_bar.dart';
import 'package:graduation_project/screens/freelancer_home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReplyProposal with ChangeNotifier {
  TextEditingController noteController = TextEditingController();
  String? token;

  Future<void> replyProposal(
    BuildContext context, {
    required String token,
    required bool isAccepted,
    required String note,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5140/api/ProposalReplay/project/1012'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          "isAccepted": isAccepted,
          "note": "${noteController.text}",
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

        showFlushBar('Proposal Reply Sent Successfully', isError: false);
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
