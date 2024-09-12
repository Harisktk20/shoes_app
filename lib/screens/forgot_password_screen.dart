import 'package:flutter/material.dart';
import 'package:showes_app/screens/signup_screen.dart';

import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController sameEmailController = TextEditingController();
  final GlobalKey<FormState> forgotkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 252, 250, 250),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Form(
          key: forgotkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return const SignUpScreen();
                  }));
                },
                icon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 35,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  "Recovery Password!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const Center(
                child: Text(
                  "Please Enter Your Email Address To",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Center(
                child: Text(
                  "Recieve a Verification Code",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  validations: isEmailValid,
                  labeltext: "Email",
                  controlllers: sameEmailController,
                  hinttext: "enter your email",
                  keboard: TextInputType.emailAddress,
                  sufex: const Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: CustomButton(
                    onTap: () {
                      
                      if (!forgotkey.currentState!.validate()) {
                        return;
                      }
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return const LoginScreen();
                      }));
                    },
                    name: "Continue",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fubction for Valid Email Address
  String? isEmailValid(value) {
    if (value!.isEmpty) {
      return "Email can't be empty";
    }
    if (value.trim() != value) {
      return "email cannot conatin leading or trailing spaces";
    }

    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (!RegExp(emailPattern).hasMatch(value)) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }
}
