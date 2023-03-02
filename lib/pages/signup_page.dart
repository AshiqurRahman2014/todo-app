import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/signin_page.dart';
import 'package:todo_app/services/auth_services.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool circular = false;
  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepOrange,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              textItem('Email ', _emailController, false),
              SizedBox(
                height: 10,
              ),
              textItem('Password ', _passController, true),
              SizedBox(
                height: 30,
              ),
              bottomItem("assets/google.svg", 'Continue with google', 25, () async{
                await authClass.googleSignIn(context);
              }),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                child: circular ? CircularProgressIndicator(): Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
                onPressed: () async{
                  setState(() {
                    circular = true;
                  });
                  try{
                    firebase_auth.UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passController.text);
                    print(userCredential.user!.email);
                    setState(() {
                      circular = false;
                    });
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>HomePage()),
                            (route) => false);
                  }catch(e){
                    final snackbar = SnackBar(content: Text(e.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    setState(() {
                      circular = false;
                    });
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Did you have already Account? ',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>SigninPage()),
                              (route) => false);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomItem(String imagePath, String bottomName, double size, Future<void> Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 55,
        height: 60,
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(width: 1, color: Colors.black)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagePath,
                height: size,
                width: size,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                bottomName,
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(String labeltext, TextEditingController controller, bool obscureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 65,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 17,
          color: Colors.blueGrey
        ),
        decoration: InputDecoration(
            labelText: labeltext,
            labelStyle: TextStyle(
              fontSize: 17,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 1.5, color: Colors.pink),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(width: 1, color: Colors.black))),
      ),
    );
  }
}
