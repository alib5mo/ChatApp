import 'package:chatapp/Pages/LoginPage.dart';
import 'package:chatapp/Widget/CustomBottom.dart';
import 'package:chatapp/Widget/CustomTextField.dart';
import 'package:chatapp/constans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool Loding = false;

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
                      'SIGN UP',
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
                  b5: false,
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
                            .createUserWithEmailAndPassword(
                                email: email!, password: password!);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Success')));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('weak-password')));
                        } else if (e.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('email-already-in-use')));
                        }
                      }
                      Loding = false;
                      setState(() {});
                    }
                  },
                  textButtom: 'Sign Up',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'already have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        ' Login',
                        style: TextStyle(color: Colors.lightGreenAccent),
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
