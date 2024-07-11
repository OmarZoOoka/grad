import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class EditClientProfile extends StatefulWidget {
  const EditClientProfile({super.key});

  @override
  State<EditClientProfile> createState() => _EditClientProfileState();
}

class _EditClientProfileState extends State<EditClientProfile> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String? imageString;

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      setState(() {
        imageString = imageFile.path;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KoffwhiteColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(20),
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Edit Your Profile:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  InkWell(
                    onTap: pickImage,
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: KgreenColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          'Pick Image',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  imageString != null
                      ? Image.file(
                          File(imageString!),
                          width: 100,
                          height: 100,
                        )
                      : Text(
                          'No image selected',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                ],
              ),
              SizedBox(height: 60),
              InkWell(
                onTap: () => updateProfile(),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: KgreenColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateProfile() {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    userProvider.changeUserDataForClient(
      nameController.text,
      imageString ?? '',
      phoneNumberController.text,
    );
    Navigator.pop(context);
  }
}
