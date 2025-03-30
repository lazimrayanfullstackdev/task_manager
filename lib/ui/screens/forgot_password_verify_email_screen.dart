import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/forgot_password_pin_verification_screen.dart';
import 'package:task_manager/ui/screens/register_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class ForgotPasswordVerifyEmailScreen extends StatefulWidget {
  const ForgotPasswordVerifyEmailScreen({super.key});

  @override
  State<ForgotPasswordVerifyEmailScreen> createState() => _ForgotPasswordVerifyEmailScreenState();
}

class _ForgotPasswordVerifyEmailScreenState extends State<ForgotPasswordVerifyEmailScreen> {

  final TextEditingController _emailTEController = TextEditingController();

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
                Text("Your Email Address", style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge),
                SizedBox(height: 4,),
                Text("A 6 Digit Verification PIN will be sent to your email", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                )),
                SizedBox(height: 24,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailTEController,
                  decoration: InputDecoration(
                  hintText: "Email",)
                  ,),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: _onTapSubmitButton,
                    child: Icon(
                      Icons.arrow_circle_right_outlined, color: Colors.white,)),
                SizedBox(height: 32,),
                Center(
                  child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),
                          children: [
                            TextSpan(text: "Remember Your Password? "),
                            TextSpan(text: "Sign in", style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _onTapSignInButton,)
                          ]
                      )),
                )
              ],
            ),
          ),
        )
        )
    );
  }

  void _onTapSubmitButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPasswordPinVerificationScreen()));
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }

}