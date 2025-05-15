import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../bottom_nav/custom_widget/custom_appbar.dart';

class MocksScreen extends StatefulWidget {
  const MocksScreen({super.key});

  @override
  State<MocksScreen> createState() => _MocksScreenState();
}

class _MocksScreenState extends State<MocksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mock Screen",style: CustomTextStyle.boldFont18Style),
          ],),
      )
    );
  }
}
