import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class SubProjectScreen extends StatefulWidget {
  const SubProjectScreen({super.key});

  @override
  State<SubProjectScreen> createState() => _SubProjectScreenState();
}

class _SubProjectScreenState extends State<SubProjectScreen> {
  final List<Map<String, dynamic>> projects = [
   
    {'price': 10, 'description': 'I need ui ux, \nbackend,\n ai \nto work for \nmy project'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KoffwhiteColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: KlightGreen,
                      borderRadius: BorderRadius.circular(20),
                      onTap: () { 
                        print("click");
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: 300,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: KgreenColor,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                offset: Offset(1, 1),
                                color: KgreenColor,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$${projects[index]['price']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: KgreenColor,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      projects[index]['description'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "View Full Project",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
