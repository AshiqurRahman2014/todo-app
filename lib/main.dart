import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/pages/add_todo_page.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/signin_page.dart';
import 'package:todo_app/pages/signup_page.dart';
import 'package:todo_app/services/auth_services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentPage = SigninPage();
  AuthClass authClass = AuthClass();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin()async {
    String? token = await authClass.getToken();
    if(token!=null){
      setState(() {
        currentPage = HomePage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  currentPage,
    );
  }
}


