import 'package:flutter/material.dart';

class UserFields extends StatelessWidget {
  const UserFields({
    super.key,
    required this.contentHead,
    required this.contentValue,
  });
  final String contentHead;
  final String contentValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          contentHead,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          contentValue,
          style:  TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }
}
