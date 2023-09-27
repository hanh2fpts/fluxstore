import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/presentation/account/forgot_password_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String routeName = 'log_in_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Log into \nyour account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Email address'),
                  )),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Password'),
                  )),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(ForgotPasswordPage.routeName),
                  child: const Text(
                    'Forgot Password ?',
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Color(0xFF2D201C),
                              )),
                          onPressed: () {},
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(height: 30,),
                    const Text('or log in with', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset('assets/icons/apple_icon.svg'),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: SvgPicture.asset('assets/icons/google_icon.svg')),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: SvgPicture.asset('assets/icons/facebook_icon.svg')),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 50,),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: RichText(
                      text: TextSpan(
                        text: 'Don’t have an account? ',
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: const [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
