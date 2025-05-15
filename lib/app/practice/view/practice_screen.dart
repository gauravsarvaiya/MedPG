import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../bottom_nav/custom_widget/custom_appbar.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _Practice_screenState();
}

class _Practice_screenState extends State<PracticeScreen> {
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
              Text("Practice Screen",style: CustomTextStyle.boldFont18Style),
            ],),
        )
    );
  }
}
