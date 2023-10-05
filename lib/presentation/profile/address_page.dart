import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluxstore/app_config/text_style_config.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});
  static const String routeName = 'address_page';

  @override
  State<AddressPage> createState() => _AddressPageState();
}

enum SingingCharacter { home, work }

class _AddressPageState extends State<AddressPage> {
  SingingCharacter _character = SingingCharacter.work;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery address', style: TextStyleConfig.titleStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: CupertinoRadio<SingingCharacter>(
                  value: SingingCharacter.work,
                  groupValue: _character,
                  onChanged: (value) {
                    setState(() {
                      _character = value!;
                    });
                  },
                ),
                title: Row(
                  children: [
                    const Icon(Icons.business),
                    const SizedBox(width: 20),
                    RichText(
                      text: const TextSpan(
                        text: 'SEND TO \n',
                        style: TextStyle(fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'My Office',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                subtitle: const Text('SBI Building, street 3, Software Park'),
                trailing: const Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              child: ListTile(
                leading: CupertinoRadio<SingingCharacter>(
                  value: SingingCharacter.home,
                  groupValue: _character,
                  onChanged: (value) {
                    setState(() {
                      _character = value!;
                    });
                  },
                ),
                title: Row(
                  children: [
                    const Icon(Icons.home),
                    const SizedBox(width: 20),
                    RichText(
                      text: const TextSpan(
                        text: 'SEND TO \n',
                        style: TextStyle(fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'My home',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                subtitle: const Text('SBI Building, street 3, Software Park'),
                trailing: const Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(40),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: null,
            child: Text('Add new address'),
          ),
        ),
      ),
    );
  }
}
