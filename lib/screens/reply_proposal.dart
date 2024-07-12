import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/client_dashboard.dart';
import 'package:graduation_project/services/reply_proposal_provider.dart';
import 'package:provider/provider.dart';

class ReplyProposalScreen extends StatefulWidget {
  const ReplyProposalScreen({Key? key}) : super(key: key);

  @override
  State<ReplyProposalScreen> createState() => _ReplyProposalScreenState();
}

class _ReplyProposalScreenState extends State<ReplyProposalScreen> {
  String? _selectedOption;
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<ReplyProposal>(context);

    return Scaffold(
      backgroundColor: KoffwhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
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
                  "Proposal 1",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 40),
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
                  Text(
                    "Is Accepted",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  DropdownButton<String>(
                    value: _selectedOption,
                    hint: Text("Select an option"),
                    dropdownColor: KoffwhiteColor,
                    iconEnabledColor: KgreenColor,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    items: <String>['Accept', 'Deny'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOption = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Notes",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 350,
                    child: TextFormField(
                      controller: noteController,
                      decoration: InputDecoration(
                        hintText: "Enter your notes here",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        bool isAccepted = _selectedOption == 'Accept';

                        await jobProvider.replyProposal(
                          context,
                          token: jobProvider.token!,
                          isAccepted: isAccepted,
                          note: noteController.text,
                        );

                        Flushbar flushbar = Flushbar(
                          message: 'Proposal Sent',
                          messageText: Text(
                            "Reply Sent Successfully",
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
                              builder: (context) => ClientDashboard(),
                            ),
                          );
                        });
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
                            "Reply Proposal",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
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
