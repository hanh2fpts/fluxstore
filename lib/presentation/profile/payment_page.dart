import 'package:flutter/material.dart';
import 'package:fluxstore/app_config/text_style_config.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});
  static const String routeName = 'payment_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyleConfig.titleStyle,
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text('Card Management'),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Add new+',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
          CreditCardWidget(
            cardNumber: '',
            expiryDate: '',
            cardHolderName: 'cardHolderName',
            cvvCode: 'cvvCode',
            showBackView: true,
            glassmorphismConfig: Glassmorphism(
              blurX: 10.0,
              blurY: 10.0,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.grey.withAlpha(20),
                  Colors.white.withAlpha(20),
                ],
                stops: const <double>[
                  0.3,
                  0,
                ],
              ),
            ),
            backgroundImage: 'assets/card_bg.png',
            labelValidThru: 'VALID\nTHRU',
            obscureCardNumber: true,
            obscureInitialCardNumber: false,
            obscureCardCvv: true,
            isHolderNameVisible: false,
            height: 175,
            textStyle: const TextStyle(color: Colors.yellowAccent),
            width: MediaQuery.of(context).size.width,
            isChipVisible: true,
            isSwipeGestureEnabled: true,
            animationDuration: const Duration(milliseconds: 1000),
            frontCardBorder: Border.all(color: Colors.grey),
            backCardBorder: Border.all(color: Colors.grey),
            onCreditCardWidgetChange: (p0) {},
          ),
        ],
      ),
    );
  }
}
