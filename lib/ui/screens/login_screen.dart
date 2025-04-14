import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/forgot_password_verify_email_screen.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/screens/register_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80,),
                Text("Get Started With", style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge),
                SizedBox(height: 24,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailTEController,
                  decoration: InputDecoration(
                  hintText: "Email",)
                  ,),
                SizedBox(height: 8,),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: InputDecoration(
                      hintText: "Password"
                  ),
                ),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: _onTapSubmitButton,
                    child: Icon(
                      Icons.arrow_circle_right_outlined, color: Colors.white,)),
                SizedBox(height: 32,),
                Center(
                  child: Column(
                    children: [
                      TextButton(onPressed: _onTapForgotPasswordButton,
                          child: Text("Forgot Password?")),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),
                              children: [
                                TextSpan(text: "Don't Have an Account? "),
                                TextSpan(text: "Sign up", style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _onTapSignUpButton,)
                              ]
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        )
    );
  }

  void _onTapSubmitButton(){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainBottomNavScreen()),
          (predicate) => false,
    );
  }

  void _onTapSignUpButton() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  void _onTapForgotPasswordButton() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ForgotPasswordVerifyEmailScreen()));
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}