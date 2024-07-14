import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/freelancer_dashboard.dart';

class SubProject extends StatefulWidget {
  const SubProject({super.key});

  @override
  State<SubProject> createState() => _SubProjectState();
}

class _SubProjectState extends State<SubProject> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KoffwhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Create SubProject",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Price',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a price';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 200,
                          child: TextFormField(
                            maxLines: null,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(),
                            ),
                            textAlignVertical: TextAlignVertical.top,
                            expands: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a description';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 40),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                Flushbar flushbar = Flushbar(
                                  message: 'SubProject Created',
                                  messageText: Text(
                                    "SubProject Created Successfully",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  flushbarStyle: FlushbarStyle.FLOATING,
                                  backgroundColor: KgreenColor,
                                  boxShadows: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  duration: const Duration(seconds: 3),
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.all(100),
                                );

                                flushbar.show(context).then((value) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FreelancerDashboard(),
                                    ),
                                  );
                                });
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                color: KgreenColor,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(offset: Offset(0, 0), blurRadius: 3),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Create",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
}
