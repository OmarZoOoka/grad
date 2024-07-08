import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/reply_proposal.dart';
import 'package:graduation_project/widgets/proposal_row_widget.dart';

class ProposalScreen extends StatefulWidget {
  const ProposalScreen({super.key});

  @override
  State<ProposalScreen> createState() => _ProposalScreenState();
}

class _ProposalScreenState extends State<ProposalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KoffwhiteColor,
      body: SingleChildScrollView(
        child: Column(
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
                  "Proposal 1",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 275,
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
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
                  ProposalRows(
                    text1: 'Created:',
                    text2: '2024-06-05 12:51',
                  ),
                  ProposalRows(
                      text1: "Description:", text2: "This is a descreption"),
                  ProposalRows(text1: "Price:", text2: "\$24"),
                  ProposalRows(text1: "Deliver By:", text2: "2024-07-02"),
                  ProposalRows(
                      text1: "Freelancer:",
                      text2: "37a561ab-dfa2-54fd-bedg-2351"),
                  ProposalRows(text1: "ID:", text2: "215dfa051"),
                  ProposalRows(text1: "Work ID:", text2: "5"),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReplyProposalScreen(),
                          ));
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: KgreenColor,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(offset: Offset(0, 0), blurRadius: 3)
                          ]),
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
        ),
      ),
    );
  }
}
