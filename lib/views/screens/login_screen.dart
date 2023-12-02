// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mini_e_commerce/core/colors.dart';
import 'package:mini_e_commerce/core/functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Login',
        style: TextStyle(
            color: AppColors.prmaryColor, fontWeight: FontWeight.bold),
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                myTextFormField(_emailController, "Email", myValidator),
                myTextFormField(_passwordController, "Password", myValidator,
                    obscureText: true),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String? userData = await getStoredString("user_data");
                    if (userData != null && userData.isNotEmpty) {
                      Map<String, dynamic> user = json.decode(userData);
                      if (email == user["email"] &&
                          password == user["password"]) {
                        Navigator.of(context).pushNamed("/home");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Email ou mot de passe incorrects'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('User Not Registered'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/signup");
                  },
                  child: const Text("Sign-Up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myTextFormField(
    TextEditingController? controller,
    String? labelText,
    String? Function(String?)? validator, {
    bool obscureText = false,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              labelText: labelText,
            ),
            validator: validator),
      );
}
