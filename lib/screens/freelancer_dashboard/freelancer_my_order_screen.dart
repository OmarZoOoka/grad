import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/widgets/prject_widget.dart';

class FreelancerMyOrderScreen extends StatefulWidget {
  const FreelancerMyOrderScreen({Key? key}) : super(key: key);

  @override
  State<FreelancerMyOrderScreen> createState() => _FreelancerMyOrderScreenState();
}

class _FreelancerMyOrderScreenState extends State<FreelancerMyOrderScreen> {
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
                              "Expected Deliever Date",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 90,
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
                        "assets/images/1.png",
                        "Brote - Cleanin\nServices\nTemplate Kit",
                        "\$53",
                        "Pending Payment",
                        "Novomber 11, 2024, 11:20 AM",
                        Colors.orange,
                        Icons.mail_outline_rounded,
                        Icons.visibility,
                        EdgeInsets.only(left: 70),
                        width: 280,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProjectWidget(
                        "assets/images/2.png",
                        "Nas Best\nDigital Agency\nWebsite Design",
                        "\$23",
                        "Pending Payment",
                        "September 12, 2024, 5:41 PM",
                        Colors.green,
                        Icons.mail_outline_rounded,
                        Icons.visibility,
                        EdgeInsets.only(left: 70),
                        width: 280,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProjectWidget(
                        "assets/images/3.png",
                        "File Manager\nCloud Storage\nApp Mobile",
                        "\$69",
                        "Canceled",
                        "Mars 5, 2024, 12:00 AM",
                        Colors.red,
                        Icons.mail_outline_rounded,
                        Icons.visibility,
                        EdgeInsets.only(left: 70),
                        width: 280,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProjectWidget(
                        "assets/images/4.png",
                        "Hiring Platform\nDashboard\nFlutter",
                        "\$44",
                        "Canceled",
                        "April 2, 2024, 01:10 PM",
                        Colors.red,
                        Icons.mail_outline_rounded,
                        Icons.visibility,
                        EdgeInsets.only(left: 70),
                        width: 280,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProjectWidget(
                        "assets/images/5.png",
                        "Ui Ux\nWeb Designer\n.NET",
                        "\$41",
                        "In The Progress",
                        "January 13, 2024, 10:43 PM",
                        Colors.green,
                        Icons.mail_outline_rounded,
                        Icons.visibility,
                        EdgeInsets.only(left: 70),
                        width: 280,
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
