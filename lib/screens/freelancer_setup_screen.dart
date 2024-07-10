import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
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

  List<Map<String, dynamic>> selectedSkills = [];
  List<int> selectedSkillIds = [];
  List<Map<String, dynamic>> skills = [];

  @override
  void initState() {
    super.initState();
    fetchSkills();
  }

  Future<void> fetchSkills() async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.fetchSkills();
    setState(() {
      skills = userProvider.skills;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Freelancer Setup'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: kcyanColor),
        ),
        child: Stepper(
          type: StepperType.vertical,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isFinalStep = currentStep == getSteps().length - 1;
            if (isFinalStep) {
              updateProfile();
              print("Stepper complete");
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (currentStep == 0) {
              return;
            } else {
              setState(() {
                currentStep -= 1;
              });
            }
          },
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: Text('Add Image'),
        content: Column(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(KgreenColor)),
              onPressed: pickImage,
              child: Text(
                'Add Image',
                style: TextStyle(color: Colors.white),
              ),
            ),
            if (imageString != null)
              Image.file(
                File(imageString!),
              ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text('Add Phone Number'),
        content: Column(
          children: [
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: Text('Add Your Name'),
        content: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
          ],
        ),
      ),
      Step(
        isActive: currentStep >= 3,
        title: Text('Add Skills'),
        content: Wrap(
          children: skills.map(
            (skill) {
              bool isSelected = selectedSkills.contains(skill);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedSkills.remove(skill);
                      selectedSkillIds.remove(skill['id']);
                    } else {
                      selectedSkills.add(skill);
                      selectedSkillIds.add(skill['id']);
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: isSelected ? KgreenColor : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    skill['name'],
                    style: TextStyle(
                      color: isSelected ? KgreenColor : Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    ];
  }

  void updateProfile() {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    userProvider.changeUserDataForFreelancer(
      nameController.text,
      imageString ?? '',
      phoneNumberController.text,
      skills: selectedSkillIds,
    );
    print(selectedSkillIds);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FreelancerProfile()),
    );
  }
}
