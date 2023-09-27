import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});
  static const String routeName = 'forgot_password_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Forgot Password ?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              SizedBox(height: 20,),
              Text('Enter email associated with your account and we’ll send and email with intructions to reset your password')
            ],
          ),
        ),
      ),
    );
  }
}
