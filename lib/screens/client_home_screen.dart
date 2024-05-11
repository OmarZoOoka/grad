import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:graduation_project/services/user_provider.dart';
import 'package:provider/provider.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({Key? key}) : super(key: key);

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    List<Map<String, dynamic>> categories = userProvider.categories;
    final allCategories = categories.map((category) {
      final imageUrl = category['imageUrl'].toString();
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16.0),
          child: Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      child: Image.network(
                        imageUrl,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category['name'] ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();

    List<String> images = [
      'assets/images/person-1.jpg',
      'assets/images/person-2.jpg',
      'assets/images/person-3.jpg'
    ];

    return Scaffold(
      backgroundColor: Color(0xffF7F4F1),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Freelancer',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            Text(
              'Hub',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await userProvider.logout();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 950,
              width: double.infinity,
              color: Colors.cyan[900],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Find Your Perfect",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          "Freelancer ",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Quick",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      "and Easy",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search for any service...',
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: Colors.green, width: 2.0),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.search, color: Colors.white),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'Search',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < images.length; i++)
                          Align(
                            widthFactor: 0.7,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 35,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(images[i]),
                              ),
                            ),
                          ),
                        SizedBox(width: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '39M+',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  color: Colors.white),
                            ),
                            Text(
                              'Happy Customers',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        '4.9',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 20,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("assets/images/freelancing.png"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Get some inspiration from 12k+ skills',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: allCategories,
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                pauseAutoPlayOnTouch: false,
                onPageChanged: (index, reason) {
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person),
                    style: ButtonStyle(alignment: Alignment.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
