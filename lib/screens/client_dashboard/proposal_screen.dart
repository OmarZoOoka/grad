import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/reply_proposal.dart';
import 'package:graduation_project/widgets/proposal_row_widget.dart';

// Define a data model for proposals (optional but recommended)
class Proposal {
  final String created;
  final String description;
  final String price;
  final String deliverBy;
  final String freelancerId;
  final String workId;

  Proposal({
    required this.created,
    required this.description,
    required this.price,
    required this.deliverBy,
    required this.freelancerId,
    required this.workId,
  });
}

class ProposalScreen extends StatefulWidget {
  const ProposalScreen({super.key});

  @override
  State<ProposalScreen> createState() => _ProposalScreenState();
}

class _ProposalScreenState extends State<ProposalScreen> {
  // Example list of proposals
  final List<Proposal> proposals = [
    Proposal(
      created: '2024-06-05 12:51',
      description: 'This is a description',
      price: '\$24',
      deliverBy: '2024-07-02',
      freelancerId: '37a561ab-dfa2-54fd-bedg-2351',
      workId: '5',
    ),
    Proposal(
      created: '2024-06-06 14:20',
      description: 'Another description',
      price: '\$30',
      deliverBy: '2024-08-10',
      freelancerId: '37a561ab-dfa2-54fd-bedg-2352',
      workId: '6',
    ),
    // Add more proposals as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KoffwhiteColor,
      body: ListView.separated(
        itemCount: proposals.length,
        separatorBuilder: (context, index) => SizedBox(),
        itemBuilder: (context, index) {
          final proposal = proposals[index];
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
                    "Proposal ${index + 1}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 275,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    ProposalRows(text1: 'Created:', text2: proposal.created),
                    ProposalRows(text1: "Description:", text2: proposal.description),
                    ProposalRows(text1: "Price:", text2: proposal.price),
                    ProposalRows(text1: "Deliver By:", text2: proposal.deliverBy),
                    ProposalRows(text1: "Freelancer ID:", text2: proposal.freelancerId),
                    ProposalRows(text1: "Work ID:", text2: proposal.workId),
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
                          boxShadow: [BoxShadow(offset: Offset(0, 0), blurRadius: 3)],
                        ),
                        child: Center(
                          child: Text(
                            "Reply Proposal",
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
      ),
    );
  }
}
