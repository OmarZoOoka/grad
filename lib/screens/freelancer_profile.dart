import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/freelancer_dashboard.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:provider/provider.dart';

class FreelancerProfile extends StatefulWidget {
  const FreelancerProfile({Key? key}) : super(key: key);

  @override
  _FreelancerProfileState createState() => _FreelancerProfileState();
}

class _FreelancerProfileState extends State<FreelancerProfile> {
  CarouselController buttonCarouselController = CarouselController();

  List<String> serviceImages = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
  ];
  final jobsTitle = [
    "Engineering",
    "Digital Marketing",
    "Branding Design",
    "AI Services",
    "Design & Creative",
    "Sales & Marketing",
    "Software Engineering",
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KoffwhiteColor,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: KgreenColor,
            ),
          ),
          title: Row(
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kcyanColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.person,
                color: kcyanColor,
              )
            ],
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(KgreenColor)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FreelancerDashboard()));
              },
              child: Text(
                "Dashboard",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Consumer<UserProvider>(builder: (context, userProvider, _) {
          final userData = userProvider.userData;
          if (userData == null) {
            // If user data is null, fetch it
            userProvider.showData();
            return Center(child: CircularProgressIndicator());
          } else {
            // Data has been fetched, proceed with building UI
            final String name = userData['result']['name'] ?? 'Unknown';
            final String imageUrl = userData['result']['imageUrl'] ?? "";
            final int jobTitle = userData['result']['categoryId'] ?? "";
            final String phoneNumber = userData['result']['phoneNumber'] ?? '';
            List<dynamic> skills = userData['result']['skills'] ?? [];

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 650,
                    width: double.infinity,
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(3, 3),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            child: imageUrl.length != 0
                                ? Image.network(imageUrl)
                                : CircleAvatar(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "$name",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${jobsTitle[jobTitle]}",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                  ),
                                  Text(
                                    "4.9 (999 Reviews)",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 105,
                                width: double.infinity,
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 20),
                                decoration: BoxDecoration(
                                  color: KoffwhiteColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Location",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Rate",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Jobs",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Tanta",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "90\$/hr",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "666",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Contact Me:",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                          KgreenColor,
                                        ),
                                        elevation: MaterialStatePropertyAll(10),
                                        shadowColor: MaterialStatePropertyAll(
                                            Colors.lightGreen)),
                                    onPressed: () {},
                                    child: Text(
                                      "$phoneNumber",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Skills",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Wrap(
                                      spacing: 10,
                                      children: skills.map((skill) {
                                        String skillName = skill['name'];
                                        return Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: KoffwhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(-0.9, 0.5),
                                                blurRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: Text(skillName),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: CarouselSlider(
                      items: serviceImages.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      image,
                                      fit: BoxFit.cover,
                                      scale: 0.7,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$30',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.green),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.star),
                                            Text(
                                              '4.5',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'File Manager Cloud Storage App Design',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          maxRadius: 18,
                                          backgroundColor: Colors.black,
                                          child: CircleAvatar(
                                            maxRadius: 15,
                                            backgroundImage: AssetImage(
                                                "assets/images/person-1.jpg"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Random Person",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        aspectRatio: 16 / 17,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 1,
                        pauseAutoPlayOnTouch: false,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    height: 780,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Color(0xff06121D)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/images/logo.png",
                              ),
                              width: 65,
                              height: 65,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Freelancer',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: KgreenColor,
                                      fontSize: 35),
                                ),
                                Text(
                                  'Hub',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking atits layout the point of using lorem varius sit amet ipsum.',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Subscribe to Our Newsletter',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'We\'ll keep you updated with the best new jobs.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(color: Color(0xff23323e)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Email Address",
                                    hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.4),
                                      fontSize: 15,
                                    ),
                                    filled: true,
                                    fillColor: KgreyColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                        color: KgreyColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                        color: Colors.green,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 18),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: double.infinity,
                                width: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90),
                                    border:
                                        Border.all(color: Color(0xff23323e)),
                                    color: KgreenColor),
                                child: Center(
                                  child: Text(
                                    "Subscribe",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Contact Us",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "+20 1234 123 123",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "FreelancerHub@gmail.com",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Tanta University",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        }));
  }
}
