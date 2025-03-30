import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/screens/register_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController _newPasswordTEController = TextEditingController();
  final TextEditingController _confirmNewPasswordTEController = TextEditingController();

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
                Text("Set Password", style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge),
                SizedBox(height: 4,),
                Text("Set a new Password with minimum length of 6 letter", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                )),
                SizedBox(height: 24,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _newPasswordTEController,
                  decoration: InputDecoration(
                      hintText: "New Password"
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  controller: _confirmNewPasswordTEController,
                  decoration: InputDecoration(
                      hintText: "Confirm New Password"
                  ),
                ),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: _onTapSubmitButton,
                    child: Text("Confirm")),
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
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LoginScreen()), (pre)=>false,);
  }

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LoginScreen()), (pre)=>false,);
  }

}