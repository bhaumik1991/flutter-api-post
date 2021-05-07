import 'package:flutter/material.dart';
import 'package:flutter_post_req/api/user_api.dart';
import 'package:flutter_post_req/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  UserModel _user;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP POST"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: jobController,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async{
                  final String name = nameController.text;
                  final String jobTitle = jobController.text;

                  final UserModel user = await createUser(name, jobTitle);

                  setState(() {
                    _user = user;
                  });

                },
                child: Text("Send")
            ),
            SizedBox(height: 30,),

            _user == null ? Container() :
            Text("The user ${_user.name}, ${_user.id} is created at time ${_user.createdAt.toIso8601String()} and His Job title is ${_user.job}")
          ],
        ),
      ),
    );
  }
}


