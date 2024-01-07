import 'package:flutter/material.dart';
import 'package:tasksflutter/models/user_model.dart';
import 'package:tasksflutter/screens/widgets/custom_user_fields.dart';


class MyDatascreen extends StatelessWidget {
  UserModel userModel;
  MyDatascreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade300,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://i.pinimg.com/736x/4f/91/f8/4f91f8dfc62a867bbce2d5418d39f9b1.jpg"),
                    radius: 85,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Column(
                  children: [
                    UserFields(
                      contentHead: 'Name :',
                      contentValue: userModel.name,
                    ),
                    UserFields(
                      contentHead: 'Mobile Number :',
                      contentValue: userModel.mobileNum,
                    ),
                    UserFields(
                        contentHead: 'E-Mail',
                        contentValue: userModel.email),
                    UserFields(
                        contentHead: "Age",
                        contentValue: userModel.age.toString()),
                    UserFields(
                        contentHead: "Password",
                        contentValue: userModel.password),
                    UserFields(
                        contentHead: "Gender",
                        contentValue: userModel.isGender),
                    UserFields(
                        contentHead: "Indian",
                        contentValue: userModel.isIndian),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
