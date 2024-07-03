import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/dashboard/dashboard_screen.dart';
import 'package:graduation_project/screens/dashboard/projects_screen.dart';
import 'package:graduation_project/screens/dashboard/my_order_screen.dart';
import 'package:graduation_project/screens/dashboard/post_job_screen.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:provider/provider.dart';

class FreelancerDashboard extends StatefulWidget {
  const FreelancerDashboard({Key? key}) : super(key: key);

  @override
  State<FreelancerDashboard> createState() => _FreelancerDashboardState();
}

class _FreelancerDashboardState extends State<FreelancerDashboard> {
  String selectedContainer = '';

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(
          maxRadius: 25,
          backgroundImage: AssetImage("assets/images/person-2.jpg"),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
      body: selectedContent(selectedContainer),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(
                      "assets/images/logo.png",
                    ),
                    height: 80,
                    width: 80,
                    color: KgreenColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        appName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: KgreenColor,
                            fontSize: 30),
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
              },
            ),
            buildDrawerItem(
              'Post a Job',
              Icons.post_add,
              () {
                setState(() {
                  selectedContainer = 'Post a Job';
                });
              },
            ),
            buildDrawerItem(
              'My Orders',
              Icons.mark_email_read_outlined,
              () {
                setState(() {
                  selectedContainer = 'My Orders';
                });
              },
            ),
            buildDrawerItem(
              'Projects',
              Icons.document_scanner,
              () {
                setState(() {
                  selectedContainer = 'Projects';
                });
              },
            ),
            SizedBox(
              height: 350,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      size: 60,
                    ),
                    onPressed: () async {
                      await userProvider.logout();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedContent(String selectedContainer) {
    switch (selectedContainer) {
      case 'Dashboard':
        return Dashboard();
      case 'Post a Job':
        return PostJobScreen();
      case 'My Orders':
        return MyOrderScreen();
      case 'Projects':
        return ProjectScreen();
      default:
        return Dashboard();
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
            boxShadow: [BoxShadow(offset: Offset(0, 0.5))]),
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
