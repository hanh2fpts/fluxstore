import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/app_config/app_config.dart';
import 'package:fluxstore/presentation/home/home_page.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});
  static const String routeName = 'create_new_password_page';

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;
  late TextEditingController _confirmController;
  bool isShowPassword = true;
  bool isShowConfirm = true;
  bool isButtonEnabled = false;
  @override
  void initState() {
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void checkButtonStatus() {
    setState(() {
      isButtonEnabled = _passwordController.text.isNotEmpty && _confirmController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create new password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text('Your new password must be different from previously used password'),
                const SizedBox(height: 50),
                TextFormField(
                  controller: _passwordController,
                  obscureText: isShowPassword,
                  onChanged: (value) {
                    checkButtonStatus();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter new password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      child: isShowPassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmController,
                  obscureText: isShowConfirm,
                  onChanged: (value) {
                    checkButtonStatus();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter new password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowConfirm = !isShowConfirm;
                          });
                        },
                        child: isShowConfirm
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      )),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isButtonEnabled
                        ? () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height * 1 / 2,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(20),
                                      right: Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          radius: 50,
                                          child: SvgPicture.asset('assets/icons/Success.svg'),
                                        ),
                                        const Text(
                                          'Your password has been changed',
                                          style: TextStyle(
                                            fontSize: 24,
                                          ),
                                        ),
                                        const Text(
                                          'Welcome back! Discover now!',
                                          style: TextStyle(
                                            color: Color(0xFF332118),
                                          ),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              AppConfig.currentIndex = 0;
                                              Navigator.of(context)
                                                  .pushReplacementNamed(HomePage.routeName);
                                            },
                                            child: const Text('Browse home'))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        : null,
                    child: const Text('Change password'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
