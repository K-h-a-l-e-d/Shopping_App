import 'package:flutter/material.dart';
import '../../home_screen.dart';
import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hiddenPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        centerTitle: true,
        title: Text(
          'Electronics Stores',
          style: TextStyle(
              fontSize: 30,
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
                Image.network(
                    "https://logos-world.net/wp-content/uploads/2022/06/Capgemini-Logo-700x394.png"),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Email not valid';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: hiddenPassword,
                  controller: passwordController,
                  validator: (value) {
                    if (value != null && value.length < 6) {
                      return 'Password must contain 6 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          togglePassword();
                        },
                        icon: Icon(hiddenPassword
                            ? Icons.visibility
                            : Icons.visibility_off)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    debugPrint(emailController.text);
                    debugPrint(passwordController.text);
                    if (_formKey.currentState!.validate()) {
                      isLoggedIn = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ));
                    } else {
                      SnackBar snackBar = SnackBar(
                        content: Text("Enter a valid data"),
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(label: 'OK', onPressed: () {}),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text("Login"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  child: Text('Create new Account'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  togglePassword() {
    hiddenPassword = !hiddenPassword;
    setState(() {});
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
