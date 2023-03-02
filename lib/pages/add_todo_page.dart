import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              IconButton(onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>HomePage()),
                        (route) => false);
              }, icon: Icon(Icons.arrow_back, color: Colors.pink, size: 28,),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Column(
                children: [
                  Text("Create",style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold, letterSpacing: 4),),
                  SizedBox(height: 8,),
                  Text("New Todo",style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold, letterSpacing: 2),),
                  SizedBox(height: 25,),
                  label("Task Title"),
                  SizedBox(height: 12,),
                  title(),
                  SizedBox(height: 30,),
                  label("Task Type"),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      chipData("Important", 0xff2664fa),
                      SizedBox(width: 20,),
                      chipData("Important", 0xff2bc8d9),
                    ],
                  ),
                  SizedBox(height: 25,),
                  label("Discreption"),
                  SizedBox(height: 12,),
                  discreption(),
                  SizedBox(height: 25,),
                  label("Catagory"),
                  SizedBox(height: 12,),
                  Wrap(
                    runSpacing: 10,
                    children: [
                      chipData("Food", 0xff2664fa),
                      SizedBox(width: 20,),
                      chipData("Workout", 0xff2bc8d9),
                      SizedBox(width: 20,),
                      chipData("Work", 0xff6557ff),
                      SizedBox(width: 20,),
                      chipData("Class", 0xff234ebd),
                      SizedBox(width: 20,),
                      chipData("Hangout", 0xff2bc8d9),
                    ],
                  ),
                ],
              ),)

            ],
          ),
        ),
      ),
    );
  }

  Widget chipData(String lable, int color){
    return Chip(
      backgroundColor: Color(color),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      label: Text(lable,style: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w600
    ),
    ),
      labelPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 3.8),
    );
  }
  Widget discreption(){
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color(0xff2a2e3d),
          borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
        style: TextStyle(
            color: Colors.grey,
            fontSize: 17
        ),
        maxLines: null,
        decoration: InputDecoration(
            hintText: "New Task",
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 17
            ),
            contentPadding: EdgeInsets.only(
              left: 20,
              right: 20,
            )
        ),
      ),
    );
  }
  Widget title(){
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
        style: TextStyle(
            color: Colors.grey,
            fontSize: 17
        ),
        decoration: InputDecoration(
          hintText: "New Task",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 17
          ),
          contentPadding: EdgeInsets.only(
            left: 20,
            right: 20,
          )
        ),
      ),
    );
  }
  Widget label(String label){
    return Text(label,style: TextStyle(fontSize: 16,
        fontWeight: FontWeight.bold,

        letterSpacing: 0.2),);
  }
}
