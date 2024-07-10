import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/reply_proposal.dart';
import 'package:graduation_project/services/project_proposal_provider.dart';
import 'package:graduation_project/widgets/proposal_row_widget.dart';
import 'package:provider/provider.dart';

class ProposalScreen extends StatefulWidget {
  const ProposalScreen({Key? key}) : super(key: key);

  @override
  State<ProposalScreen> createState() => _ProposalScreenState();
}

class _ProposalScreenState extends State<ProposalScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch proposals when the screen initializes
    Future.microtask(() {
      Provider.of<ProjectProposal>(context, listen: false).projectgetproposal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KoffwhiteColor,
      body: Consumer<ProjectProposal>(
        builder: (context, projectProposal, _) {
          if (projectProposal.proposalData == null) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            itemCount: projectProposal.proposalData!.length,
            separatorBuilder: (context, index) => SizedBox(),
            itemBuilder: (context, index) {
              final proposalData = projectProposal.proposalData![index];

              return Column(
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
                    child: Center(
                      child: Text(
                        "Proposal ${proposalData['id']}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                      bottom: 10,
                    ),
                    margin: EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProposalRows(
                          text1: 'Created:',
                          text2: formatDate(proposalData['createdTime']),
                        ),
                        ProposalRows(
                          text1: "Description:",
                          text2: proposalData['description'],
                        ),
                        ProposalRows(
                          text1: "Price:",
                          text2: "\$${proposalData['price'].toString()}",
                        ),
                        ProposalRows(
                          text1: "Deliver By:",
                          text2: formatDate(proposalData['deliverDate']),
                        ),
                        ProposalRows(
                          text1: "Freelancer ID:",
                          text2: proposalData['freelancerId'],
                        ),
                        ProposalRows(
                          text1: "Work ID:",
                          text2: proposalData['workId'].toString(),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReplyProposalScreen(),
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
                                "Reply Proposal",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }
}
