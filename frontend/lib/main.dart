import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/APIs/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  Map data = {};
  List<dynamic> result = [];
  bool dataLoaded = false;
  bool isEdit = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Target APIs')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Add this line
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: imageUrlController,
                    decoration: InputDecoration(
                      labelText: 'Image Url',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5),
              isEdit
                  ? ElevatedButton(
                      onPressed: () async {
                        await Api().updateData(result[0]['_id'], {
                          'name': nameController.text,
                          'email': emailController.text,
                          'imageUrl': imageUrlController.text,
                        });
                        result = await Api().readData();
                        setState(() {
                          dataLoaded = true;
                        });
                      },
                      child: Text('Update Profile'),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        //print('button pressed')
                        // final messenger = ScaffoldMessenger.of(context);

                        // messenger.showSnackBar(SnackBar(content: Text('hey')));
                        final data = await Api().createData({
                          'name': nameController.text,
                          'email': emailController.text,
                          'imageUrl': imageUrlController.text,
                        });
                        result = await Api().readData();

                        setState(() {
                          dataLoaded = true;
                        });
                        print(data);
                        // messenger.showSnackBar(SnackBar(content: Text(data.toString())));
                      },
                      child: Text('Save Profile'),
                    ),
              SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () {
              //     Api().createData();
              //   },
              //   child: Text('Send'),
              // ),
              Divider(),
              Text(
                'All User Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              dataLoaded && result.isNotEmpty && result[0]['imageUrl'] != null
                  ? Column(
                      children: [
                        Container(
                          height: 200,
                          width: 150,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                fit: BoxFit.cover,

                                //data['imageUrl'] ?? ''
                                //'https://d27jswm5an3efw.cloudfront.net/app/uploads/2019/08/image-url-3.jpg',
                                result[0]['imageUrl'],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          result[0]['name'],

                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          //data['email']
                          //'arslan@default.com',
                          result[0]['email'],

                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isEdit = true;
                                  nameController.text = result[0]['name'];
                                  emailController.text = result[0]['email'];
                                  imageUrlController.text =
                                      result[0]['imageUrl'];
                                });
                              },
                              child: Text(
                                'Edit',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ),
                            SizedBox(width: 60),
                            InkWell(
                              onTap: () async {
                                await Api().deleteData(result[0]['_id']);
                                result = await Api().readData();
                                setState(() {
                                  dataLoaded = result.isNotEmpty;
                                });
                              },
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            result = await Api().readData();
            print('result: $result');
            if (result.isNotEmpty) {
              setState(() {
                dataLoaded = true;
              });
            } else {
              setState(() {
                dataLoaded = false;
              });
            }
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
