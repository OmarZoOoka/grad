import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:image_picker/image_picker.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({Key? key}) : super(key: key);

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedSkill;
  int months = 0;
  int days = 0;
  double? budget;
  final List<String> skills = [
    'Skill 1',
    'Skill 2',
    'Skill 3',
    'Skill 4',
    'Skill 5',
  ];
  final List<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5',
  ];
  List<String>? selectedSKills = [];
  String? imageString;
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
    return Container(
      width: double.infinity,
      height: double.maxFinite,
      color: KoffwhiteColor,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: KgreenColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Job info",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Title',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a title';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            maxLines: null,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a description';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          DropdownButtonFormField<String>(
                            value: selectedSkill,
                            onChanged: (value) {
                              setState(() {
                                selectedSkill = value;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Required category',
                              border: OutlineInputBorder(),
                            ),
                            items: categories
                                .map((category) => DropdownMenuItem<String>(
                                      value: category,
                                      child: Text(category),
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a category';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Wrap(
                            children: skills.map(
                              (skill) {
                                bool isSelected = false;
                                if (selectedSKills!.contains(skill)) {
                                  isSelected = true;
                                }
                                return GestureDetector(
                                  onTap: () {
                                    if (!selectedSKills!.contains(skill)) {
                                      if (selectedSKills!.length < 5) {
                                        selectedSKills!.add(skill);
                                        setState(() {});
                                        print(selectedSKills);
                                      }
                                    } else {
                                      selectedSKills!.removeWhere(
                                          (element) => element == skill);
                                      setState(() {});
                                      print(selectedSKills);
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 4),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                            color: isSelected
                                                ? KgreenColor
                                                : Colors.grey,
                                            width: 2),
                                      ),
                                      child: Text(
                                        skill,
                                        style: TextStyle(
                                            color: isSelected
                                                ? KgreenColor
                                                : Colors.grey,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Expected Duration ',
                                    labelText: 'Months',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      months = int.tryParse(value) ?? 0;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Expected Duration',
                                    labelText: 'Days',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      days = int.tryParse(value) ?? 0;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Expected Budget',
                              labelText: 'Budget',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                budget = double.tryParse(value);
                              });
                            },
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate,
                            size: 50,
                          ),
                          Text(
                            'Add Image',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      )),
                    ),
                  ),
                  if (imageString != null)
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: KgreyColor,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: FileImage(
                            File(imageString!),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // Process the form data
                }
              },
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                    color: KgreenColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    'Post Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
