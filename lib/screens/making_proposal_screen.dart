import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/services/job_proposal_provider.dart';
import 'package:graduation_project/services/job_provider.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:provider/provider.dart';

class MakingProposal extends StatefulWidget {
  final int projectId;

  const MakingProposal({Key? key, required this.projectId}) : super(key: key);

  @override
  State<MakingProposal> createState() => _MakingProposalState();
}

class _MakingProposalState extends State<MakingProposal> {
  TextEditingController priceController = TextEditingController();
  TextEditingController deliverDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    priceController.dispose();
    deliverDateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var jobProposal = Provider.of<JobProposal>(context);
    var jobProvider = Provider.of<JobProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    final Map<String, dynamic>? job = jobProvider.jobsData
        ?.firstWhere((job) => job['id'] == widget.projectId);
    int? projectId = widget.projectId;
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
                  "Proposal for Project No. ${job?['id']}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
                  TextFormField(
                    controller: jobProposal.priceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    style: TextStyle(fontSize: 18),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a price';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );
                      if (picked != null) {
                        setState(() {
                          String formattedDate =
                              "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                          jobProposal.dateController.text = formattedDate;
                        });
                      }
                    },
                    child: AbsorbPointer(
                      absorbing: true, // Disable user interaction
                      child: TextFormField(
                        controller: jobProposal.dateController,
                        decoration: InputDecoration(
                          labelText: 'Delivery Date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                        ),
                        style: TextStyle(fontSize: 18),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a delivery date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: jobProposal.descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    style: TextStyle(fontSize: 18),
                    keyboardType: TextInputType.multiline,
                    maxLines: null, // Allow multiline input
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  jobProposal.postJob(
                    context,
                    token: userProvider.userToken!,
                    projectId: projectId,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: KgreenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                ),
                child: Text(
                  "Send Proposal",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
