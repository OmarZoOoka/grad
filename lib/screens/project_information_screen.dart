import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/making_proposal_screen.dart';
import 'package:graduation_project/services/job_provider.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:provider/provider.dart';

class ProjectInformation extends StatelessWidget {
  final int projectId;

  const ProjectInformation({Key? key, required this.projectId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context, listen: false);
    var userData = Provider.of<UserProvider>(context, listen: false);
    final clientdata = userData.userData;
    final Map<String, dynamic>? job =
        jobProvider.jobsData?.firstWhere((job) => job['id'] == projectId);

    return Scaffold(
      backgroundColor: KoffwhiteColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 75,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                color: KlightGreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Project Information",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Project No. ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        job?['id'].toString() ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _buildRow("Project Title:", job?['title'] ?? ''),
                  SizedBox(height: 10),
                  _buildDescriptionRow(
                      "Description:", job?['description'] ?? ''),
                  SizedBox(height: 10),
                  _buildRow("Start Date:", job?['startDate'] ?? ''),
                  SizedBox(height: 10),
                  _buildRow(
                      "Expected Budget:", "\$${job?['expectedBudget'] ?? ''}"),
                  SizedBox(height: 10),
                  _buildRow("Duration:",
                      "${job?['expectedDuration']['months']} months ${job?['expectedDuration']['days']} days"),
                  SizedBox(height: 10),
                  _buildSkillsRow("Skills:", job?['skills']),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 75,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: KlightGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Client Information",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRow(
                      "Name:", clientdata?['result']['name'] ?? 'Unknown'),
                  SizedBox(height: 10),
                  _buildRow("Location:", "Tanta"),
                  SizedBox(height: 10),
                  _buildRow("Phone Number:",
                      clientdata?['result']['phoneNumber'] ?? 'Unknown'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MakingProposal(
                        projectId: projectId,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: KgreenColor,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Send Proposal",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
           
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionRow(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsRow(String title, List<dynamic>? skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: (skills ?? [])
              .map((skill) => Text(
                    '- ${skill['name']}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
