import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/presentation/account/log_in_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static const String routeName = 'sign_up_page';
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
              'Create \nyour account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email address',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
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
                          'SIGN UP',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'or sign up with',
                    style: TextStyle(color: Colors.black26),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
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
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(LoginPage.routeName),
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have account? ',
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: const [
                          TextSpan(
                            text: 'Log In',
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
    ));
  }
}
