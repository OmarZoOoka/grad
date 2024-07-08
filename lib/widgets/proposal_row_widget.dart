import 'package:flutter/material.dart';

class ProposalRows extends StatelessWidget {
  final String text1;
  final String text2;

  const ProposalRows({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        Text(text2,style: TextStyle(fontWeight: FontWeight.w500),),
      ],
    );
  }
}
