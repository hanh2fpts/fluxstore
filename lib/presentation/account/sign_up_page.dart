import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/presentation/account/log_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String routeName = 'sign_up_page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late FocusNode _nameFocus;
  late FocusNode _addressFocus;
  late FocusNode _passwordFocus;
  late FocusNode _confirmPasswordFocus;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _nameFocus = FocusNode();
    _addressFocus = FocusNode();
    _passwordFocus = FocusNode();
    _confirmPasswordFocus = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocus.dispose();
    _addressFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        if(_nameFocus.hasFocus || _addressFocus.hasFocus || _passwordFocus.hasFocus || _confirmPasswordFocus.hasFocus){
          _nameFocus.unfocus();
          _addressFocus.unfocus();
          _passwordFocus.unfocus();
          _confirmPasswordFocus.unfocus();
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
                  'Create \nyour account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocus,
                    autofocus: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: _addressController,
                    focusNode: _addressFocus,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email address',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    focusNode: _confirmPasswordFocus,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your confirm password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Processing Data')),
                                );
                              }
                            },
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
        ),
      ),
    ));
  }
}
