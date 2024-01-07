import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasksflutter/models/user_model.dart';
import 'package:tasksflutter/screens/dataScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonController = TextEditingController();

  List<UserModel> dataList = [];

  UserModel? newUser;
  String? name;
  String? password;
  int? age;
  String? email;
  String? mobileNum;
  bool isGender = false;
  bool isIndian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("NEW TASK"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final userIndex = dataList[index];

          return Card(
            child: ListTile(
              tileColor: Colors.amber,
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(userIndex.isIndian == 'Indian' ? 'IND' : '---'),
              ),
              title: Text(userIndex.name),
              subtitle: Text(userIndex.email),
              trailing:
                  Icon(userIndex.isGender == 'Male' ? Icons.man : Icons.woman),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyDatascreen(userModel: userIndex),
                  )),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showForm(context);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Input Form'),
          content: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter user name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                      hintText: "password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(
                      hintText: "age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter address ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: "email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _phonController,
                  decoration: InputDecoration(
                      hintText: "phone",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('FEMALE'),
                    Switch(
                      value: isGender,
                      onChanged: (value) {
                        setState(() {
                          isGender = value;
                        });
                      },
                    ),
                    const Text('MALE'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Indian'),
                    Checkbox(
                      value: isIndian,
                      onChanged: (bool? value) {
                        setState(() {
                          isIndian = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addUser(
                        _nameController.text,
                        _passController.text,
                        int.parse(_ageController.text),
                        _emailController.text,
                        _phonController.text,
                        isGender,
                        isIndian,
                      );
                      Navigator.of(context).pop();
                      _nameController.clear();
                      _passController.clear();
                      _ageController.clear();
                      _emailController.clear();
                      _phonController.clear();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void addUser(
    String inpName,
    String inpPass,
    int inpAge,
    String inpEmail,
    String inpNum,
    bool inpGen,
    bool inpNat,
  ) {
    final UserModel currentUser = UserModel(
      name: inpName,
      password: inpPass,
      age: inpAge,
      email: inpEmail,
      mobileNum: inpNum,
      isGender: inpGen ? 'Male' : 'Female',
      isIndian: inpNat ? 'Indian' : 'Not-Indian',
    );

    setState(() {
      dataList.add(currentUser);
    });
  }
}
