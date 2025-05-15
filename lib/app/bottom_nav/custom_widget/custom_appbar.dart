import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import '../../home/route/home_route.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget{
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize =>  Size.fromHeight(70.sp);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.sp),
      child: AppBar(
        backgroundColor: kPrimaryColor,
        leadingWidth: 90.sp,
        leading: Row(children: [
          SizedBox(width: 20.sp),
          Container(
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(8.sp)),
            child: Image.asset("assets/images/themedico-logo.png"),
          ),
        ],),
        title: Text("themedico.app"),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: (){
              HomeRoute.goToNotificationPage(context);
            },
            child: Stack(
              children: [
                Container(
                  padding:  EdgeInsets.only(right: 10.sp),
                  child: Icon(Icons.notification_add_outlined,size: 30.sp,color: kWhiteColor,),
                ),
                Positioned(
                  top: 0.sp,
                  right: 2.sp,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.sp,vertical: 2),
                    decoration: BoxDecoration(
                        color: kRedColor,
                        borderRadius: BorderRadius.circular(50.sp)
                    ),
                    child:Center(child: Text("99+",style: CustomTextStyle.regularFont14Style,)),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 10.sp),

          GestureDetector(
            onTap: (){
              HomeRoute.goToProfilePage(context);
            },
            child: Container(
              height: 40.sp,
              width: 40.sp,
              padding: EdgeInsets.all(1.sp),
              decoration: BoxDecoration(
                  color: kWhiteColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(50.sp)
              ),
              child: Center(child: Text("SG",style: CustomTextStyle.boldFont24Style.copyWith(fontSize: 14.sp),)),
            ),
          ),

          SizedBox(width: 20.sp),

        ],
      ),
    );
  }
}
