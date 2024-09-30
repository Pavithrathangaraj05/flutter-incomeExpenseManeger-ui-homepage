import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class Profilepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 40),
              child: Column(children: [
                // Centered image
                Center(
                  child: Container(
                    width: 100.0, // Set image width
                    height: 100.0, // Set image height
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Create a circle for the image
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFA8ewdwEhnD6NRpS665hs1zkxDmr6c3vgdn2t1qwGsVKTpKppZe1sTbXakbWYGXwzW9Q&usqp=CAU"),
                        fit: BoxFit.cover, // Ensure image fills the container
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0), // Add spacing between image and text

                // First row with centered text widgets
                Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center content horizontally
                  children: [
                    Text(
                      "Ashwin",
                      style: TextStyle(fontSize: 20.0), // Customize text style
                    ),
                    SizedBox(width: 10.0), // Add spacing between texts
                    Text(
                      "ashwinash@gmail.com",
                      style: TextStyle(
                          fontSize: 16.0,
                          color:Colors.grey,
                          // fontWeight: FontWeight.bold
                          ),
                      // Customize text style
                    ),
                  ],
                ),

                // Second row with centered text widgets
                Container(
                  // Add margin around the container
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align content to the left
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "                '\n'    Account",
                          style:
                              TextStyle(fontSize: 16.0), // Customize text style
                        ),
                      ),
                    ],
                  ),
                ),

                // Container with black background, rounded corners, and shadow
                Container(
                    margin: EdgeInsets.all(25),
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          31, 249, 246, 246), // Added background color
                      border: Border.all(
                        color: Colors.black12,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // Changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      // Align content vertically
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Column(
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 10.0),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            // Add spacing between icons
                            Icon(Icons.key),
                            SizedBox(width: 10.0),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            SizedBox(width: 10.0), // Add spacing between icons
                            Icon(Icons.logout),
                          ],
                        ),
                        Expanded(
                          // Ensures "Total Expense" text fills available space
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align text to the left
                            children: [
                              Text(
                                '   Account Information',
                                style: TextStyle(
                                  fontSize: 15,
                                  height:
                                      1.2, // Adjust for desired line spacing (1.2 times font size)
                                ),
                              ),
                              SizedBox(
                                  height:
                                      10), // You can remove this if using height in TextStyle
                              Text(
                                '   Change Password',
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      10), // You can remove this if using height in TextStyle
                              Text(
                                '   Export Data',
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Container(
                  // Add margin around the container
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align content to the left
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "             '\n'       SETTINGS",
                          style:
                              TextStyle(fontSize: 16.0), // Customize text style
                        ),
                      ),
                    ],
                  ),
                ),

                // Container with black background, rounded corners, and shadow
                Container(
                    margin: EdgeInsets.all(25),
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          31, 249, 246, 246), // Added background color
                      border: Border.all(
                        color: Colors.black12,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // Changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // Align content vertically
                      children: [
                        Column(
                          // Holds the three icons
                          children: [
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            Icon(Icons.settings_outlined),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            Icon(Icons.punch_clock_sharp),
                            Padding(padding: EdgeInsets.only(bottom: 10)),

                            Icon(Icons.backup),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            // Add spacing between icons
                            Icon(Icons.question_mark_outlined),
                            SizedBox(width: 10.0),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: 10)), // Add spacing between icons
                            Icon(Icons.logout),
                          ],
                        ),
                        Expanded(
                          // Ensures "Total Expense" text fills available space
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align text to the left
                            children: [
                              Text(
                                '   Settings',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '   Data and Privacy',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '   Backup and Restore',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '   Help and Support',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '   Log Out',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ])),
        ),
        backgroundColor: Color.fromARGB(255, 245, 243, 252),
      ),
    );
  }
}
