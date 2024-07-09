import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/services/job_provider.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:provider/provider.dart';

class ClientPostProjectScreen extends StatefulWidget {
  const ClientPostProjectScreen({Key? key}) : super(key: key);

  @override
  State<ClientPostProjectScreen> createState() =>
      _ClientPostProjectScreenState();
}

class _ClientPostProjectScreenState extends State<ClientPostProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCategory;
  int months = 0;
  int days = 0;
  double? budget;
  int? selectedCategoryId;
  final List<String> categories = [
    "Engineering",
    "Digital Marketing",
    "Branding Design",
    "AI Services",
    "Design & Creative",
    "Sales & Marketing",
    "Software Engineering",
  ];
  List<String>? selectedSKills = [];
  List<int> selectedSkillsId = [];
  String? imageString;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final jobProvider = Provider.of<JobProvider>(context);

    final skills = userProvider.skills;
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
                            controller: jobProvider.titleController,
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
                            controller: jobProvider.descController,
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
                            value: selectedCategory,
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value;
                                selectedCategoryId = categories
                                    .indexWhere((item) => item == "$value");
                                print(selectedCategoryId);
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
                                if (selectedSKills!.contains(skill["name"])) {
                                  isSelected = true;
                                }
                                return GestureDetector(
                                  onTap: () {
                                    print(selectedSKills);
                                    if (!selectedSKills!
                                        .contains(skill["name"])) {
                                      if (selectedSKills!.length <
                                          skills.length) {
                                        selectedSKills!.add(skill["name"]);
                                        selectedSkillsId.add(skill["id"]);
                                        setState(() {
                                          print(selectedSKills);
                                          print(selectedSkillsId);
                                        });
                                      }
                                    } else {
                                      selectedSKills!.removeWhere((element) =>
                                          element == skill["name"]);
                                      selectedSkillsId.removeWhere(
                                          (element) => element == skill["id"]);
                                      setState(() {
                                        print(selectedSkillsId);
                                      });
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
                                        skill["name"],
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
                              Text(
                                "Expected duration",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: jobProvider.monthsController,
                                  decoration: InputDecoration(
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
                                  controller: jobProvider.daysController,
                                  decoration: InputDecoration(
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
                            controller: jobProvider.budgetController,
                            decoration: InputDecoration(
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
            InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  // Process the form data
                  await jobProvider.postJob(context,
                      categoryId: selectedCategoryId!,
                      skillsListId: selectedSkillsId,
                      token: userProvider.userToken);
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
