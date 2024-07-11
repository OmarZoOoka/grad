import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/client_dashboard/client_dashboard_screen.dart';
import 'package:graduation_project/screens/client_dashboard/client_my_order_screen.dart';
import 'package:graduation_project/screens/client_dashboard/client_my_projects.dart';
import 'package:graduation_project/screens/client_dashboard/client_post_job_screen.dart';
import 'package:graduation_project/screens/client_dashboard/edit_client_profile.dart';
import 'package:graduation_project/screens/client_dashboard/proposal_screen.dart';
import 'package:graduation_project/screens/client_profile.dart';
import 'package:graduation_project/services/project_proposal_provider.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:provider/provider.dart';

class ClientDashboard extends StatefulWidget {
  const ClientDashboard({Key? key}) : super(key: key);

  @override
  State<ClientDashboard> createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  String selectedContainer = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var projectProposal = Provider.of<ProjectProposal>(context);
    var showImage = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(
          radius: MediaQuery.of(context).size.width * .07,
          backgroundImage:
              NetworkImage(showImage.userData?['result']['imageUrl']),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ClientProfile(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          )
        ],
      ),
      body: Builder(
        builder: (context) {
          return selectedContent(selectedContainer);
        },
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: kcyanColor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Image(
                          image: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          'Sho8lana',
                          style: TextStyle(
                            color: KgreenColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            buildDrawerItem(
              'Dashboard',
              Icons.dashboard,
              () {
                setState(() {
                  selectedContainer = 'Dashboard';
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            buildDrawerItem(
              'Create a Project',
              Icons.post_add,
              () {
                setState(() {
                  selectedContainer = 'Create a Project';
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            buildDrawerItem(
              'My Orders',
              Icons.mark_email_read_outlined,
              () {
                setState(() {
                  selectedContainer = 'My Orders';
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            buildDrawerItem(
              'Projects',
              Icons.document_scanner,
              () {
                setState(() {
                  selectedContainer = 'Projects';
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            buildDrawerItem(
              'Proposal',
              Icons.mark_email_read_outlined,
              () async {
                await projectProposal.projectgetproposal();
                print("the proposal data is ${projectProposal.proposalData}");
                setState(() {
                  selectedContainer = 'Proposal';
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            buildDrawerItem(
              'Edit Profile',
              Icons.mark_email_read_outlined,
              () {
                setState(() {
                  selectedContainer = 'Edit Profile';
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 140,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.logout,
                          size: 40,
                        ),
                        onPressed: () async {
                          await userProvider.logout();
                        },
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedContent(String selectedContainer) {
    switch (selectedContainer) {
      case 'Dashboard':
        return ClientDashboardScreen();
      case 'Create a Project':
        return ClientPostProjectScreen();
      case 'My Orders':
        return ClientMyOrderScreen();
      case 'Projects':
        return ClientProjectScreen();
      case 'Proposal':
        return ProposalScreen();
      case 'Edit Profile':
        return EditClientProfile();
      default:
        return ClientDashboardScreen();
    }
  }

  Widget buildDrawerItem(String text, IconData icon, VoidCallback onTap) {
    bool isSelected = selectedContainer == text;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: isSelected ? KgreenColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(offset: Offset(0, 0.5))],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : KgreenColor,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
