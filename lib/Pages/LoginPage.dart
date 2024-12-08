import 'package:chatapp/Pages/ChatScreen.dart';
import 'package:chatapp/Pages/SignUpPage.dart';
import 'package:chatapp/Widget/CustomBottom.dart';
import 'package:chatapp/Widget/CustomTextField.dart';
import 'package:chatapp/constans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;

  bool Loding = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Loding,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'assets/images/scholar.png',
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Scholat Chat',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'pacifico'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                ),

                const Row(
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomTextField(
                  b5: false,
                  onChanged: (value) {
                    email = value;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomTextField(
                  b5: true,
                  onChanged: (value) {
                    password = value;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                //Bottom
                CustomBottom(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      Loding = true;
                      setState(() {});
                      try {
                        UserCredential user = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email!, password: password!);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen(email: email!,)));
                      } on FirebaseAuthException catch (x) {
                        if (x.code == 'user-not-found') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('user-not-found')));
                        } else if (x.code == 'wrong-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('uwrong-password')));
                        }
                      }
                      Loding = false;
                      setState(() {});
                    }
                  },
                  textButtom: 'Login',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'dont\'t have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        ' sign up',
                        style: TextStyle(color: Colors.lightGreenAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
