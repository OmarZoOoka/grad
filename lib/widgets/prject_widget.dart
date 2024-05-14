import 'package:flutter/material.dart';

class ProjectWidget extends StatelessWidget {
  ProjectWidget(
    this.imagePath,
    this.projectName,
    this.amount,
    this.status,
    this.date,
    this.color,
    this.icon1,
    this.icon2,
    this.leftPadding, {
    this.containerColor,
    this.containerPadding,
    this.width,
  });
  final String imagePath;
  final String projectName;
  final String amount;
  final String status;
  final String date;
  final Color color;
  final IconData icon1;
  final IconData icon2;
  final Color? containerColor;
  final EdgeInsetsGeometry? containerPadding;
  final double? width;
  final EdgeInsetsGeometry? leftPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 75,
            width: 75,
            padding: containerPadding,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image(
              image: AssetImage(imagePath),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  projectName,
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              amount,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 40,
              width: 150,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: color.withOpacity(0.3),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Text(
                  status,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Padding(
            padding: leftPadding!,
            child: Container(
              width: width,
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.grey.withOpacity(0.3)),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
            ),
            onPressed: () {},
            icon: Icon(icon1),
            iconSize: 30,
          ),
          SizedBox(
            width: 8,
          ),
          IconButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.grey.withOpacity(0.3)),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
            ),
            onPressed: () {},
            icon: Icon(icon2),
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}
