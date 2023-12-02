import 'package:flutter/material.dart';
import 'package:mini_e_commerce/core/colors.dart';
import 'package:mini_e_commerce/core/functions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Sign Up',
          style: TextStyle(
              color: AppColors.prmaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              myTextFormField(_usernameController, 'Username', myValidator),
              myTextFormField(_emailController, 'Email', myValidator),
              myTextFormField(_passwordController, 'Password', myValidator,
                  obscureText: true),
              myTextFormField(_rePasswordController, 'Re-enter Password',
                  (val) => rePasswordValidator(val, _passwordController.text),
                  obscureText: true),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    saveUserCredentials({
                      "user_name": _usernameController.text,
                      "email": _emailController.text,
                      "password": _passwordController.text
                    });
                    Navigator.of(context).pushNamed("/login");
                  }
                },
                child: const Text('Sign Up'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Login"),
              )
            ],
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
