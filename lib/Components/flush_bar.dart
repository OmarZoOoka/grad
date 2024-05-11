import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/services/navigation_service.dart';

showFlushBar(
  String title, {
  bool isError = true,
}) {
  Column(
    children: [
      Flushbar(
        message: title,
        messageText: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        backgroundColor: isError ? Colors.red : Colors.green,
        shouldIconPulse: false,
        boxShadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
        icon: isError
            ? const Icon(
                Icons.error,
                color: Colors.white,
                size: 20,
              )
            : const Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
        duration:const  Duration(seconds: 3),
        padding:const  EdgeInsets.all(5),
        margin:const  EdgeInsets.all(20),
        maxWidth: 150,
      )..show(NavigationService.context!),
    ],
  );
}
