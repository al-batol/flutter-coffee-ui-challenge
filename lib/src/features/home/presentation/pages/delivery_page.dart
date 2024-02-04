import 'package:coffee_shop_ui_challenge/src/core/common/utils/constants.dart';
import 'package:flutter/material.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Text('data'),
        ],
      ),
      bottomSheet: Container(
        height: 120,
        color: Colors.red,
      ),
    );
  }
}
