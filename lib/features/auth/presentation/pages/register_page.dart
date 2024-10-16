import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe/features/auth/presentation/components/my_button.dart';
import 'package:vibe/features/auth/presentation/components/my_textfield.dart';
import 'package:vibe/features/auth/presentation/cubits/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();

  // register method
  void register(){
    // prepare info
    final String name = nameController.text;
    final String email = emailController.text;
    final String pw = pwController.text;
    final String confirmPw = confirmPwController.text;

    // auth Cubit
    final autCubit = context.read<AuthCubit>();

    // ensure the fields aren't empty
    if(name.isNotEmpty && email.isNotEmpty && pw.isNotEmpty && confirmPw.isNotEmpty){

      // ensure passwords match
      if(pw == confirmPw){
        autCubit.register(name, email, pw);
      }
      // if passwords don't match
      else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not match!")));
      }
    }

    // if fields are empty -> display error
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill all the fields")));
    }
  }

  // dispose controllers
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pwController.dispose();
    confirmPwController.dispose();
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
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  width: MediaQuery.sizeOf(context).width * 0.15,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text('L O G I N', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                // ),

                // create account message
                Text(
                  'Let\'s create an account for you',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),

                const SizedBox(
                  height: 25,
                ),

                // name textField
                MyTextfield(
                    controller: nameController,
                    hintText: "Name",
                    obsecureText: false),

                const SizedBox(
                  height: 12,
                ),

                // email textField
                MyTextfield(
                    controller: emailController,
                    hintText: "Email",
                    obsecureText: false),

                const SizedBox(
                  height: 12,
                ),

                // password textField
                MyTextfield(
                    controller: pwController,
                    hintText: "Password",
                    obsecureText: true),

                const SizedBox(
                  height: 12,
                ),

                // confirm password textField
                MyTextfield(
                    controller: confirmPwController,
                    hintText: "Confirm Password",
                    obsecureText: true),

                const SizedBox(
                  height: 25,
                ),

                // register button
                MyButton(onTap: register, text: "Register"),

                const SizedBox(
                  height: 50,
                ),

                // already a member? login now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member? ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                        onTap: widget.togglePages,
                        child: Text(
                          "Login now",
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
