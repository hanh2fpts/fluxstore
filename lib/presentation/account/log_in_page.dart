import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/presentation/account/forgot_password_page.dart';
import 'package:fluxstore/presentation/account/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = 'log_in_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _emailFocus;
  late FocusNode _passwordFocus;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (_emailFocus.hasFocus || _passwordFocus.hasFocus) {
            _emailFocus.unfocus();
            _passwordFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Form(
              key: _formKey,
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
                  SizedBox(
                      height: 50,
                      child: TextFormField(
                        focusNode: _emailFocus,
                        controller: _emailController,
                        autofocus: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email address';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(hintText: 'Email address'),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 50,
                      child: TextFormField(
                        focusNode: _passwordFocus,
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(hintText: 'Password'),
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
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Processing Data')),
                                  );
                                }
                              },
                              child: const Text(
                                'LOG IN',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text('or log in with', style: TextStyle(color: Colors.grey)),
                        const SizedBox(
                          height: 30,
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
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(SignUpPage.routeName),
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
        ),
      ),
    );
  }
}
