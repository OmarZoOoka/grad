import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/client_profile.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ClientSetupScreen extends StatefulWidget {
  const ClientSetupScreen();

  @override
  State<ClientSetupScreen> createState() => _ClientSetupScreenState();
}

class _ClientSetupScreenState extends State<ClientSetupScreen> {
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

  @override
  void initState() {
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clinet Setup'),
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
    
    ];
  }

  
  void updateProfile() {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    userProvider.changeUserDataForClient(
      nameController.text,
      imageString ?? '',
      phoneNumberController.text,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ClientProfile()),
    );
  }
}
