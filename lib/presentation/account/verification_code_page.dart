import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxstore/presentation/account/create_new_password_page.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
    fontSize: 20,
    color: Color.fromRGBO(30, 60, 87, 1),
    fontWeight: FontWeight.w600,
  ),
  decoration: BoxDecoration(
    border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});
  static const String routeName = 'verification_code_page';

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
    borderRadius: BorderRadius.circular(8),
  );

  final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: const Color.fromRGBO(234, 239, 243, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            const Text(
              'Verification code',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Please enter the verification code we sent to your email address'),
            const SizedBox(
              height: 50,
            ),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              autofocus: true,
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) {
                if (pin == '2222') {
                  Navigator.of(context).pushReplacementNamed(CreateNewPasswordPage.routeName);
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const CountDownTimerWidget(),
          ]),
        ),
      ),
    );
  }
}

class CountDownTimerWidget extends StatefulWidget {
  const CountDownTimerWidget({
    super.key,
  });
  @override
  State<CountDownTimerWidget> createState() => _CountDownTimerWidgetState();
}

class _CountDownTimerWidgetState extends State<CountDownTimerWidget> {
  String _timerValue = '00:30';
  bool _isResendOtp = false;
  int _secondsRemaining = 30;
  late Timer _timer;
  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _isResendOtp = false;
          _secondsRemaining--;
          if (_secondsRemaining >= 10) {
            _timerValue = '00:$_secondsRemaining';
          } else {
            _timerValue = '00:0$_secondsRemaining';
          }
          if (_secondsRemaining == 0) {
            _isResendOtp = true;
          }
        });
      } else {
        _secondsRemaining = 30;
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('Resend in '), Text(_timerValue)],
        ),
        _isResendOtp
            ? TextButton(
                onPressed: () => _startTimer(),
                child: const Text('Send OTP'),
              )
            : const SizedBox()
      ],
    );
  }
}
