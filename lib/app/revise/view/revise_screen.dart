import 'package:flutter/material.dart';
import 'package:medpg/utils/utils.dart';

import '../../bottom_nav/custom_widget/custom_appbar.dart';

class ReviseScreen extends StatefulWidget {
  const ReviseScreen({super.key});

  @override
  State<ReviseScreen> createState() => _ReviseScreenState();
}

class _ReviseScreenState extends State<ReviseScreen> {
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
              Text("Revices Screen",style: CustomTextStyle.boldFont18Style,),
            ],),
        )
    );
  }
}
