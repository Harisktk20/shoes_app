import 'package:flutter/material.dart';
import 'package:showes_app/screens/bottom_navigation.dart';
import 'package:showes_app/screens/onboarding_screen1.dart';
import 'package:showes_app/screens/signup_screen.dart';
import 'package:showes_app/widget/custom_button.dart';
import 'package:showes_app/widget/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isVisible = true;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
 final  GlobalKey<FormState> logkey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 252, 250, 250),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
        ),
        child: Form(
          key: logkey,
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
                    "Hello Again!",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const Center(
                  child: Text(
                    "Welcome You've been Missed",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomTextField(
                      validations: isEmail,
                        labeltext: "Email",
                        controlllers: emailController,
                        hinttext: "enter your email",
                        keboard: TextInputType.emailAddress,
                        sufex: const Icon(Icons.email))),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                      counterText: counterButton(),
                      obscureText: isVisible,
                      validations: isPasswordValid,
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
                    child: CustomButton(onTap: () {
                      if(!logkey.currentState!.validate()){
                        return;
                      }
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
                        return const BottomScreen();
                      }));
                    }, name: "Login"),
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
                  height: 40,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account?",
                      style: TextStyle(fontSize: 12),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                          return const SignUpScreen();
                        }));
                      },
                      child: const Text(
                        "Sign Up for Free",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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

// Fubction for Stri=ong Password
  String? isPasswordValid(String? value) {
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

  String? isEmail(value) {
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

  counterButton() {
    return InkWell(
      onTap: () {},
      child: const Text(
        "Recovery Password",
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
