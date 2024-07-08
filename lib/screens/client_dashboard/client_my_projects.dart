import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/widgets/prject_widget.dart';

class ClientProjectScreen extends StatefulWidget {
  const ClientProjectScreen({super.key});

  @override
  State<ClientProjectScreen> createState() => _ClientProjectScreenState();
}

class _ClientProjectScreenState extends State<ClientProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: KoffwhiteColor,
      width: double.infinity,
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: 1000,
                  height: 900,
                  child: Column(
                    children: [
                      SizedBox(width: 20),
                      Container(
                        width: double.infinity,
                        height: 65,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: KgreenColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Project Name",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              "Amount",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Text(
                              "Status",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 135,
                            ),
                            Text(
                              "Days",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 200,
                            ),
                            Text(
                              "Action",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProjectWidget(
                        "assets/images/job-1.png",
                        "Brote - Cleanin\nServices\nTemplate Kit",
                        "\$53",
                        "Pending Payment",
                        "04",
                        Colors.orange,
                        Icons.edit_square,
                        Icons.visibility,
                        EdgeInsets.only(left: 100),
                        containerColor: kcyanColor,
                        containerPadding: EdgeInsets.all(20),
                        width: 190,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProjectWidget(
                        "assets/images/job-2.png",
                        "Nas Best\nDigital Agency\nWebsite Design",
                        "\$23",
                        "Pending Payment",
                        "01",
                        Colors.green,
                        Icons.edit_square,
                        Icons.visibility,
                        EdgeInsets.only(left: 100),
                        containerColor: kcyanColor,
                        containerPadding: EdgeInsets.all(20),
                        width: 190,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProjectWidget(
                        "assets/images/job-3.png",
                        "File Manager\nCloud Storage\nApp Mobile",
                        "\$69",
                        "Canceled",
                        "03",
                        Colors.red,
                        Icons.edit_square,
                        Icons.visibility,
                        EdgeInsets.only(left: 100),
                        containerColor: kcyanColor,
                        containerPadding: EdgeInsets.all(20),
                        width: 190,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProjectWidget(
                        "assets/images/job-4.png",
                        "Hiring Platform\nDashboard\nFlutter",
                        "\$44",
                        "Canceled",
                        "02",
                        Colors.red,
                        Icons.edit_square,
                        Icons.visibility,
                        EdgeInsets.only(left: 100),
                        containerColor: kcyanColor,
                        containerPadding: EdgeInsets.all(20),
                        width: 190,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProjectWidget(
                        "assets/images/job-5.png",
                        "Ui Ux\nWeb Designer\n.NET",
                        "\$41",
                        "In The Progress",
                        "05",
                        Colors.green,
                        Icons.edit_square,
                        Icons.visibility,
                        EdgeInsets.only(left: 100),
                        containerColor: kcyanColor,
                        containerPadding: EdgeInsets.all(20),
                        width: 190,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
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
