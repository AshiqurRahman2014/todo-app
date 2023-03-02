import 'package:flutter/material.dart';
import 'package:todo_app/pages/add_todo_page.dart';
import 'package:todo_app/pages/signup_page.dart';
import 'package:todo_app/services/auth_services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../widget/todo_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Mounthly Schedule", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(35),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: const EdgeInsets.only(left: 22),
              child: Text(
                  "Friday 22",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)
              ),
            ),
          )
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>AddTodoPage()),
                  (route) => false);
        },
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              ToDoCart(
                title: 'Wake Up',
                iconData: Icons.alarm,
                iconColor: Colors.red,
                time: '5am',
                check: true,
                iconBgColor: Colors.white,
              ),
              SizedBox(height: 10,),
              ToDoCart(
                title: 'Lets go Gym',
                iconData: Icons.sports,
                iconColor: Colors.red,
                time: '7am',
                check: false,
                iconBgColor: Colors.white,
              ),
              SizedBox(height: 10,),
              ToDoCart(
                title: 'By Some Food',
                iconData: Icons.local_grocery_store,
                iconColor: Colors.red,
                time: '12pm',
                check: false,
                iconBgColor: Colors.white,
              ),
              SizedBox(height: 10,),
              ToDoCart(
                title: 'Testing Something',
                iconData: Icons.near_me,
                iconColor: Colors.red,
                time: '5pm',
                check: false,
                iconBgColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
