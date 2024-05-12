import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/screens/freelancer_profile.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FreelancerSetupScreen extends StatefulWidget {
  const FreelancerSetupScreen();

  @override
  State<FreelancerSetupScreen> createState() => _FreelancerSetupScreenState();
}

class _FreelancerSetupScreenState extends State<FreelancerSetupScreen> {
  int currentStep = 0;
  TextEditingController phoneNumberController = TextEditingController();
  List<String> selectedSkills = [];
  String? imageString;

  // Add a flag to track setup completion
  bool isSetupCompleted = false;

  @override
  void initState() {
    super.initState();
    // Check if setup is completed
    isSetupCompleted = checkSetupCompletion();
    // If setup is completed, navigate to profile screen
    if (isSetupCompleted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FreelancerProfile()),
        );
      });
    }
  }

  bool checkSetupCompletion() {
    // Check if image is provided
    bool isImageProvided = imageString != null;

    // Check if phone number is provided
    bool isPhoneNumberProvided = phoneNumberController.text.isNotEmpty;

    // Check if at least one skill is selected
    bool areSkillsProvided = selectedSkills.isNotEmpty;

    // Combine checks to determine setup completion
    bool isSetupCompleted =
        isImageProvided && isPhoneNumberProvided && areSkillsProvided;

    return isSetupCompleted;
  }

  Future<void> _pickImage() async {
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
  Widget build(BuildContext context) {
    // If setup is already completed, return an empty container
    if (isSetupCompleted) {
      return Container();
    }

    // Otherwise, proceed with the setup screen UI
    return Scaffold(
      appBar: AppBar(
        title: Text('Freelancer Setup'),
      ),
      body: Stepper(
        currentStep: currentStep,
        onStepContinue: () {
          if (currentStep < 2) {
            setState(() {
              currentStep += 1;
            });
          } else {
            _updateProfile();
          }
        },
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() {
              currentStep -= 1;
            });
          }
        },
        steps: <Step>[
          Step(
            title: Text('Add Image'),
            content: Column(
              children: [
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text(
                    'Add Image',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                if (imageString != null) Image.file(File(imageString!)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentStep += 1;
                    });
                  },
                  child: Text('Confirm'),
                ),
              ],
            ),
            isActive: currentStep == 0,
          ),
          Step(
            title: Text('Add Phone Number'),
            content: Column(
              children: [
                TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentStep += 1;
                    });
                  },
                  child: Text('Confirm'),
                ),
              ],
            ),
            isActive: currentStep == 1,
          ),
          Step(
            title: Text('Add Skills'),
            content: Column(
              children: [
                CheckboxListTile(
                  title: Text('Skill 1'),
                  value: selectedSkills.contains('Skill 1'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedSkills.add('Skill 1');
                      } else {
                        selectedSkills.remove('Skill 1');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Skill 2'),
                  value: selectedSkills.contains('Skill 2'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedSkills.add('Skill 2');
                      } else {
                        selectedSkills.remove('Skill 2');
                      }
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _updateProfile();
                  },
                  child: Text('Confirm'),
                ),
              ],
            ),
            isActive: currentStep == 2,
          ),
        ],
      ),
    );
  }

  void _updateProfile() {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    userProvider.changeUserDataForUser(
      imageString.toString(),
      phoneNumberController.text,
      selectedSkills,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FreelancerProfile()),
    );
  }
}
