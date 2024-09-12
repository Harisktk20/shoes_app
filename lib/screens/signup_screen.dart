import 'package:flutter/material.dart';
import 'package:showes_app/screens/forgot_password_screen.dart';
import 'package:showes_app/screens/login_screen.dart';

import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';
import 'onboarding_screen1.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isVisible = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFFFCFAFA),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
        ),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return const OnBoardingScreen();
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
                    "Create Account!",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const Center(
                  child: Text(
                    "Let's Create Account Together",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                    validations: isNameValid,
                    labeltext: "Name",
                    controlllers: nameController,
                    hinttext: "enter your name",
                    keboard: TextInputType.name,
                    sufex: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                    validations: isEmailValid,
                    labeltext: "Email",
                    controlllers: emailController,
                    hinttext: "enter your email",
                    keboard: TextInputType.emailAddress,
                    sufex: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                      counterText: counterButton(),
                      obscureText: isVisible,
                      validations: isPassword,
                      controlllers: passwordController,
                      hinttext: "enter your password",
                      keboard: TextInputType.visiblePassword,
                      labeltext: "Password",
                      sufex: iconButton()),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: CustomButton(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return const LoginScreen();
                        }));
                        if (formkey.currentState!.validate()) {
                          return;
                        }
                      },
                      name: "SignUp",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 50,
                    //color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google.png",
                          height: 30,
                          width: 40,
                        ),
                        const Text(
                          "Sign in with Google",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
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

  // Fubction for Strong Password
  String? isPassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter password";
    }
    String passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$';
    if (!RegExp(passwordPattern).hasMatch(value)) {
      return "Password must include an uppercase letter, lowercase letter, number, and special character";
    }
    return null;
  }

// Function for Valid Name
  String? isNameValid(value) {
    if (value!.isEmpty) {
      return "Please enter Name";
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return "Numbers are't allowed";
    }
    return null;
  }

// function for password Visibility
  Widget iconButton() {
    return IconButton(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        icon: isVisible
            ? const Icon(Icons.visibility_off_sharp)
            : const Icon(Icons.visibility_sharp));
  }

// counter Text
  counterButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return const ForgotPasswordScreen();
        }));
      },
      child: const Text(
        "Recovery Password",
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
