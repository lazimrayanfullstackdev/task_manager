import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/screens/register_screen.dart';
import 'package:task_manager/ui/screens/reset_password_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class ForgotPasswordPinVerificationScreen extends StatefulWidget {
  const ForgotPasswordPinVerificationScreen({super.key});

  @override
  State<ForgotPasswordPinVerificationScreen> createState() => _ForgotPasswordPinVerificationScreenState();
}

class _ForgotPasswordPinVerificationScreenState extends State<ForgotPasswordPinVerificationScreen> {

  final TextEditingController _pinCodeTEController = TextEditingController();

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
                Text("Pin Verification", style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge),
                SizedBox(height: 4,),
                Text("A 6 Digit Verification PIN has been sent to your email", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                )),
                SizedBox(height: 24,),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: _pinCodeTEController,
                  appContext: context,
                ),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: _onTapSubmitButton,
                    child: Text("Verify")),
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
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ResetPasswordScreen()));
  }

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LoginScreen()), (pre)=>false,);
  }

  @override
  void dispose() {
    _pinCodeTEController.dispose();
    super.dispose();
  }

}