/*

LOGIN PAGE

On this page, an existing user can login with their:

- email
- password

--------------------------------------------------

After successful login, they are navigated to the HomeScreen

If user doesn't have an account yet, they can go to the register page.

 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe/features/auth/presentation/components/my_button.dart';
import 'package:vibe/features/auth/presentation/components/my_textfield.dart';
import 'package:vibe/features/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;

  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  // login method
  void login() {
    //prepare email & pw
    final String email = emailController.text;
    final String pw = pwController.text;

    // auth cubit
    final authCubit = context.read<AuthCubit>();

    // ensure email & pw fields are not empty
    if (email.isNotEmpty && pw.isNotEmpty) {
      // login
      authCubit.login(email, pw);
    }

    // display error if fields are empty
    else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please enter both email and password')));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Image.asset(
                  'assets/images/vibely_v_logo.png',
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  width: MediaQuery.sizeOf(context).width * 0.15,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text('L O G I N', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                // ),

                // welcome back message
                Text(
                  'Welcome back, you\'ve been missed!',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),

                const SizedBox(
                  height: 25,
                ),

                // email textField
                MyTextfield(
                    controller: emailController,
                    hintText: "Email",
                    obsecureText: false),

                const SizedBox(
                  height: 10,
                ),

                // password textField
                MyTextfield(
                    controller: pwController,
                    hintText: "Password",
                    obsecureText: true),

                const SizedBox(
                  height: 25,
                ),

                // login button
                MyButton(onTap: login, text: "Login"),

                const SizedBox(
                  height: 50,
                ),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member? ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                        onTap: widget.togglePages,
                        child: Text(
                          "Register now",
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold),
                        )),
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
