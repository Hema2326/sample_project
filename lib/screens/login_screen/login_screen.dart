import 'package:flutter/material.dart';
import 'package:sample_project/router.dart';
import 'package:sample_project/screens/home_page_screen/home_page.dart';
import 'package:sample_project/screens/signup-screen/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child:Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sample Project',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: userNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password ?',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    _login();
                    print(userNameController.text);
                    print(passwordController.text);
                  },
                )
            ),
            // Row(
            //   children: <Widget>[
            //     const Text('Does not have account?'),
            //     TextButton(
            //       child: const Text(
            //         'Sign Up',
            //         style: TextStyle(fontSize: 20),
            //       ),
            //       onPressed: () {
            //       //  Navigator.push(context, MaterialPageRoute(builder: ((context) => SignupPage())));
            //       Navigator.pushNamed(context, App)
            //       },
            //     )
            //   ],
            //   mainAxisAlignment: MainAxisAlignment.center,
            // ),
          ],
        )),
  ),
    );
  }
  Future<void> _login() async {
    if (userNameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      Future.delayed(Duration(seconds: 1), () {
        for (int id = 0; id < dataAssisten.length; id++) {
          if (userNameController.text == dataAssisten[id]["UserName"] &&
              passwordController.text == dataAssisten[id]["PassWord"]) {
            String? fullname = dataAssisten[id]["FullName"] as String?;
            String? username = dataAssisten[id]["UserName"] as String?;
            prefs.setBool('user', true);
            prefs.setString('username', username!);
            prefs.setString('fullname', fullname!);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const HomePage()));
            // Navigator.pushNamed(context, AppRoutes.homePageScreen);
          }
        }
      });
    }
  }
}