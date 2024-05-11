import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class FreelancerDashboard extends StatefulWidget {
  const FreelancerDashboard({Key? key}) : super(key: key);

  @override
  State<FreelancerDashboard> createState() => _FreelancerDashboardState();
}

class _FreelancerDashboardState extends State<FreelancerDashboard> {
  String selectedContainer = '';

  Widget dashboardContent = Container(
    color: KgreenColor,
  );
  Widget postJobContent = Container(
    color: KoffwhiteColor,
  );
  Widget myJobContent = Container(
    color: KgreyColor,
  );
  Widget myOrdersContent = Container(
    color: kcyanColor,
  );

  @override
  Widget build(BuildContext context) {
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
                        'Freelancer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: KgreenColor,
                            fontSize: 30),
                      ),
                      Text(
                        'Hub',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
              'My Job',
              Icons.work,
              () {
                setState(() {
                  selectedContainer = 'My Job';
                });
              },
            ),
            buildDrawerItem(
              'My Orders',
              Icons.shopping_cart,
              () {
                setState(() {
                  selectedContainer = 'My Orders';
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedContent(String selectedContainer) {
    switch (selectedContainer) {
      case 'Dashboard':
        return dashboardContent;
      case 'Post a Job':
        return postJobContent;
      case 'My Job':
        return myJobContent;
      case 'My Orders':
        return myOrdersContent;
      default:
        return dashboardContent;
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
