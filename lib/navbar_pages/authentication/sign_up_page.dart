import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_ui/home_screen.dart';
import '../../utils/animations.dart';
import '../../utils/helper_functions.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isHiddenPassword = true;
  bool isHiddenPasswordConfirm = true;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: "signTag",
                  child: Image.asset('assets/images/estore.jpg'),
                ),
                TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    labelText: tr('full_name'),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Full Name cannot be empty';
                    } else if (!hasCapitalFirstLetters(value!)) {
                      return 'First letters must be in Uppercase';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: tr('email'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!(value!.contains('@'))) {
                      return 'Email must contain @[mail]';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: isHiddenPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => togglePasswordVisibility(),
                      icon: Icon(isHiddenPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    labelText: tr('password'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.length < 6) {
                      return 'Password must contain 6 characters';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: isHiddenPasswordConfirm,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => toggleConfirmPasswordVisibility(),
                      icon: Icon(isHiddenPasswordConfirm
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    labelText: tr('confirm_password'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.length < 6) {
                      return 'Password must contain 6 characters';
                    }
                    if (value != passwordController.text) {
                      return 'Confirmation Password must match Password Field';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  child: Text(tr('sign_up')),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        credential.user!
                            .updateDisplayName(fullNameController.text);

                        _showDialogMsgThenNavigateTo(context, MyHomePage());
                      } on FirebaseAuthException catch (e) {
                        snackBarMsg(context, msg: e.message!);
                      } catch (e) {
                        print(e.toString());
                        snackBarMsg(context, msg: e.toString());
                      }
                    } else {
                      snackBarMsg(context, msg: 'Please Enter valid data');
                    }
                  },
                )
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

  toggleConfirmPasswordVisibility() {
    isHiddenPasswordConfirm = !isHiddenPasswordConfirm;
    setState(() {});
  }

  Future<void> _showDialogMsgThenNavigateTo(context, secondPage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Account Created Successfully!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(context).push(FadeTransitionPageRoute(secondPage));
              },
            ),
          ],
        );
      },
    );
  }
}
