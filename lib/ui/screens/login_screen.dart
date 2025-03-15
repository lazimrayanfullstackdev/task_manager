import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Text("Get Started With", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 24,),
            TextFormField(decoration: InputDecoration(
              hintText: "Email",)
              ,),
            SizedBox(height: 8,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password"
              ),
            ),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined, color: Colors.white,)),
            SizedBox(height: 32,),
            Center(
              child: Column(
                children: [
                  TextButton(onPressed: _onTapForgotPasswordButton, child: Text("Forgot Password?")),
                  RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 14
                        ),
                        children:[
                          TextSpan(text: "Don't Have an Account? "),
                          TextSpan(text: "Sign up",style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,)
                        ]
                      )),
                ],
              ),
            )
          ],
        ),
      )
    )
    );
  }
}

void _onTapSignInButton() {}
void _onTapForgotPasswordButton() {}