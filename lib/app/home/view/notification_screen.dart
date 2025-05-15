import 'package:flutter/material.dart';
import 'package:medpg/app/home/view_model/home_provider.dart';
import 'package:medpg/utils/utils.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    final notificationDataList = homeProvider.notificationAppResponse.data;
    final notiLoader = homeProvider.notificationAppResponse.state == Status.LOADING;

    print("${notificationDataList?[0].message} ====== message");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
          iconTheme: IconThemeData(color: kWhiteColor),
          title: Text("Notification")
      ),
      body: notiLoader ?
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color:kPrimaryColor)
          ],),
      ):
      ListView.builder(
        itemCount: notificationDataList?.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8.sp),
            margin: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 5.sp),
            decoration: BoxDecoration(
              border: Border.all(color: kTextFiledBorderColor),
              borderRadius: BorderRadius.circular(8.sp),
              color: kWhiteColor,
            ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.notification_add_outlined),
              SizedBox(width: 10.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${notificationDataList?[index].title}",
                        style: CustomTextStyle.boldFont18Style
                    ),
                    Text(
                        "${notificationDataList?[index].message}",
                        style: CustomTextStyle.mediumFont18Style
                    ),
                  ],
                ),
              ),
              Container(
                width: 5.sp,
                height: 5.sp,
                decoration: BoxDecoration(
                  color: notificationDataList?[index].isRead == false ? kGreenColors : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
              )
            ],
          ),
        );
        },
      )
    );
  }
}



