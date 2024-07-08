import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class ClientDashboardScreen extends StatefulWidget {
  const ClientDashboardScreen({super.key});

  @override
  State<ClientDashboardScreen> createState() => _ClientDashboardScreenState();
}

class _ClientDashboardScreenState extends State<ClientDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.maxFinite,
      color: KoffwhiteColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$52",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Total Balance",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kcyanColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Image(
                        image: AssetImage(
                          "assets/images/icon-1.png",
                        ),
                        width: 100,
                        height: 100,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "53",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Total Job",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kcyanColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Image(
                        image: AssetImage(
                          "assets/images/icon-2.png",
                        ),
                        width: 100,
                        height: 100,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "12",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Complete Order",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kcyanColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Image(
                        image: AssetImage(
                          "assets/images/icon-3.png",
                        ),
                        width: 100,
                        height: 100,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "05",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Active Order",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kcyanColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Image(
                        image: AssetImage(
                          "assets/images/icon-4.png",
                        ),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
