import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/services/project_proposal_provider.dart';
import 'package:graduation_project/widgets/proposal_row_widget.dart';
import 'package:provider/provider.dart';

class FreelancerProposalsScreen extends StatefulWidget {
  const FreelancerProposalsScreen({super.key});

  @override
  State<FreelancerProposalsScreen> createState() =>
      _FreelancerProposalsScreenState();
}

class _FreelancerProposalsScreenState extends State<FreelancerProposalsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch proposals when the screen initializes
    Future.microtask(() {
      Provider.of<ProjectProposal>(context, listen: false).getProjectProposal();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KoffwhiteColor,
      body: Consumer<ProjectProposal>(
        builder: (context, projectProposal, _) {
          if (projectProposal.proposalDataFreelancer == null) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            itemCount: projectProposal.proposalDataFreelancer!.length,
            separatorBuilder: (context, index) => SizedBox(),
            itemBuilder: (context, index) {
              final proposalDataFreelancer =
                  projectProposal.proposalDataFreelancer![index];

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
                        "Proposal ${proposalDataFreelancer['id']}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 450,
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
                          text2:
                              formatDate(proposalDataFreelancer['createdTime']),
                        ),
                        ProposalRows(
                          text1: "Description:",
                          text2: proposalDataFreelancer['description'],
                        ),
                        ProposalRows(
                          text1: "Price:",
                          text2:
                              "\$${proposalDataFreelancer['price'].toString()}",
                        ),
                        ProposalRows(
                          text1: "Deliver By:",
                          text2:
                              formatDate(proposalDataFreelancer['deliverDate']),
                        ),
                        ProposalRows(
                          text1: "Freelancer ID:",
                          text2: proposalDataFreelancer['freelancerId'],
                        ),
                        ProposalRows(
                          text1: "Work ID:",
                          text2: proposalDataFreelancer['workId'].toString(),
                        ),
                        ProposalRows(
                          text1: "Accepted ?:",
                          text2:
                              proposalDataFreelancer['proposalReplay'] == null
                                  ? 'Not Replied Yet'
                                  : proposalDataFreelancer['proposalReplay']
                                          ['isAccepted']
                                      .toString(),
                        ),
                        ProposalRows(
                          text1: "Note:",
                          text2: proposalDataFreelancer['proposalReplay'] ==
                                  null
                              ? 'Not Replied Yet'
                              : proposalDataFreelancer['proposalReplay']['note']
                                  .toString(),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 60,
                              width: 200,
                              decoration: BoxDecoration(
                                color: KgreenColor,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: Text(
                                  "Create SubProject",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
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
