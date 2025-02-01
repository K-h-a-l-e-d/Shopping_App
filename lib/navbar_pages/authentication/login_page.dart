import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../home_screen.dart';
import '../../utils/helper_functions.dart';
import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHiddenPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withValues(alpha: 0.5),
        centerTitle: true,
        title: Text(
          tr('appBar_title'),
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Playfair Display',
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 16, 53, 83)),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              children: [
                Image.asset('assets/images/estore.jpg'),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: tr('email'),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!(value!.contains('@'))) {
                      return 'Email must contain @[mail].com';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: isHiddenPassword,
                  controller: passwordController,
                  validator: (value) {
                    if (value != null && value.length < 6) {
                      return 'Password must contain 6 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: tr('password'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          togglePasswordVisibility();
                        },
                        icon: Icon(isHiddenPassword
                            ? Icons.visibility
                            : Icons.visibility_off)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                        if (credential.user != null) {
                          navigateTo(context, MyHomePage());
                          snackBarMsg(context, msg: 'logged in Successfully!');
                          isLoggedIn = true;
                        } else {
                          snackBarMsg(context, msg: 'log in failed');
                        }
                      } on FirebaseAuthException catch (e) {
                        snackBarMsg(context, msg: '${e.code}');
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                        snackBarMsg(context, msg: '$e');
                      }
                    } else {
                      snackBarMsg(context, msg: 'Please Enter a valid data');
                    }
                  },
                  child: Text(tr('log_in')),
                ),
                Hero(
                  tag: "signTag",
                  child: ElevatedButton.icon(
                      onPressed: () => navigateTo(context, SignUpPage()),
                      label: Text(tr('create_new_account'))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  togglePasswordVisibility() {
    isHiddenPassword = !isHiddenPassword;
    setState(() {});
  }
}
