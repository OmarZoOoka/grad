import 'package:flutter/material.dart';

class PasswordCriteriaCheck extends StatelessWidget {
  final bool isFulfilled;
  final String criteria;

  const PasswordCriteriaCheck({
    required this.isFulfilled,
    required this.criteria,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isFulfilled ? Icons.check_circle : Icons.remove_circle,
          color: isFulfilled ? Colors.green : Colors.red,
        ),
        SizedBox(width: 8),
        Text(criteria),
      ],
    );
  }
}

class PasswordCriteriaWidget extends StatelessWidget {
  final String password;

  const PasswordCriteriaWidget({
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    // Check password criteria
    bool hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    bool hasDigit = RegExp(r'\d').hasMatch(password);
    bool hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
    bool hasMinLength = password.length >= 6;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PasswordCriteriaCheck(isFulfilled: hasLowercase, criteria: "At least one lowercase letter"),
        PasswordCriteriaCheck(isFulfilled: hasUppercase, criteria: "At least one uppercase letter"),
        PasswordCriteriaCheck(isFulfilled: hasDigit, criteria: "At least one digit"),
        PasswordCriteriaCheck(isFulfilled: hasSpecialChar, criteria: "At least one special character"),
        PasswordCriteriaCheck(isFulfilled: hasMinLength, criteria: "Minimum length of 6 characters"),
      ],
    );
  }
}
