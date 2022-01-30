import 'package:flutter/material.dart';
import 'package:flutter_instaclone/pages/signin_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static final String id = 'signup_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cpasswordController = TextEditingController();

  _callSignInPage() {
    Navigator.pushReplacementNamed(context, SignInPage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(193, 53, 132, 1),
              Color.fromRGBO(131, 58, 180, 1),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Instagram",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontFamily: 'Billabong'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //fullname
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: fullNameController,
                      decoration: const InputDecoration(
                        hintText: 'Fullname',
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(fontSize: 17.0, color: Colors.white54),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //email
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(fontSize: 17.0, color: Colors.white54),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //password
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(fontSize: 17.0, color: Colors.white54),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //confirm password
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: cpasswordController,
                      decoration: const InputDecoration(
                        hintText: 'Confirm password',
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(fontSize: 17.0, color: Colors.white54),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //sign up
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white54.withOpacity(0.2), width: 2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: _callSignInPage,
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
