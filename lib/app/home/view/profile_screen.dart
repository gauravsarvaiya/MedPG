import 'package:intl/intl.dart';
import 'package:medpg/app/bottom_nav/view_model/bottom_nav_provider.dart';
import '../../../base/base_components/custom_bottom_sheet.dart';
import '../../../base/base_components/custom_dialog_widget.dart';
import '../../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/view_model/auth_provider.dart';
import '../../../base/base_components/custom_button.dart';
import 'package:medpg/app/leading/view_model/leanding_provider.dart';

import '../view_model/home_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}



class _ProfileScreenState extends State<ProfileScreen> {

  String formatMemberSince(DateTime? date) {
    if (date == null) return '';
    final formatted = DateFormat('MMMM yyyy').format(date);
    return 'Member since $formatted';
  }



  String calculateRemainingDays(String examDateString) {
    if (examDateString.isEmpty) return '';
    final today = DateTime.now();
    final todayOnlyDate = DateTime(today.year, today.month, today.day);
    final examDate = DateTime.parse(examDateString);
    final difference = examDate.difference(todayOnlyDate);
    return difference.inDays.toString();
  }


  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final userData = authProvider.userResponse.data;
    final homeProvider = context.watch<HomeProvider>();
    final notiLoader = homeProvider.notificationAppResponse.state == Status.LOADING;
    final userLoader = authProvider.userResponse.state == Status.LOADING;
    final csrfLoader = authProvider.csrfResponse.state == Status.LOADING;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          iconTheme: IconThemeData(color: kWhiteColor),
          title: Text("Profile")
      ),
      body: notiLoader || userLoader ||  csrfLoader ?
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color:kPrimaryColor)
          ],),
      ):Container(
        padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 20.sp),
        margin: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 20.sp),
        decoration: BoxDecoration(
          border: Border.all(color: kTextFiledBorderColor),
          borderRadius: BorderRadius.circular(8.sp),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.sp,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70.sp,
                  width: 70.sp,
                  padding: EdgeInsets.all(1.sp),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(50.sp)
                  ),
                  child: Center(child: Text("SG",style: CustomTextStyle.boldFont24Style.copyWith(fontSize: 24.sp,color: kPrimaryColor),)),
                ),

                SizedBox(width: 20.sp),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${userData?.displayName}",
                          style: CustomTextStyle.boldFont18Style
                      ),
                      Text("${userData?.targetExam}",
                          style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 18.sp)
                      ),
                      Text(formatMemberSince(userData?.memberSince),
                          style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 18.sp)
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5.sp,
              children: [
                Divider(color: Colors.grey.shade300),

                Text("Exam Info",
                    style: CustomTextStyle.boldFont18Style
                ),

                SizedBox(height: 5.sp),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Target Exam",
                        style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 18.sp)
                    ),
                    Text("${userData?.targetExam}",
                        style: CustomTextStyle.regularFont16Style.copyWith(
                            fontSize: 18.sp,
                             color: kBlackColor,
                        )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Exam Date",
                        style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 18.sp)
                    ),
                    Text("${userData?.examDate}",
                        style: CustomTextStyle.regularFont16Style.copyWith(
                            fontSize: 18.sp,
                             color: kBlackColor,
                        )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Days Remaining",
                        style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 18.sp)
                    ),
                    Text(calculateRemainingDays(userData?.examDate ?? "") ,
                        style: CustomTextStyle.regularFont16Style.copyWith(
                            fontSize: 18.sp,
                             color: kBlackColor,
                        )
                    ),
                  ],
                ),

                Divider(color: Colors.grey.shade300),
              ],
            ),

            Column(
              spacing: 15.sp,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Study Goals & Baseline",
                    style: CustomTextStyle.boldFont18Style
                ),

                Container(
                  padding: EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Column(
                    spacing: 10.sp,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Target Exam Year",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 14.sp),),
                                Text("${userData?.examDate}",style: CustomTextStyle.headerFont16Style,)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Dream Rank",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 14.sp),),
                                Text("${userData?.dreamRank}",style: CustomTextStyle.headerFont16Style,)
                              ],
                            ),
                          )

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Weekly Question Target",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 14.sp),),
                                Text("${userData?.weeklyTargetQuestions}",style: CustomTextStyle.headerFont16Style,)
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Weekly Study Hours",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 14.sp),),
                                Text("${userData?.weeklyTargetStudyHours}",style: CustomTextStyle.headerFont16Style,)

                              ],
                            ),
                          )

                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),

            Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Column(
                spacing: 10.sp,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Baseline Assessment",style: CustomTextStyle.regularFont16Style,),
                          Text("Completed",style: CustomTextStyle.headerFont16Style,)
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 5.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.sp),
                          border: Border.all(color: kGreenColors),
                        ),
                        child: Text("Completed",style: CustomTextStyle.regularFont16Style.copyWith(color: Colors.green,fontSize: 14.sp),),
                      )
                    ],
                  ),

                  Divider(color: Colors.grey.shade300),

                  Text("Baseline Assessment Results",style: CustomTextStyle.regularBlueFont14Style,),
                  Text("Baseline assessment completed. Results are integrated into your progress metrics.",style: CustomTextStyle.regularBlueFont14Style,),

                ],
              ),
            ),

            CustomButton(
              isBorder: true,
              btnColor: Colors.transparent,
              borderColor: kRedColor,
              onTap:()async{
                // final lendingProvider = context.read<LendingProvider>();
                // await context.read<AuthProvider>().logOut();
                // lendingProvider.clearAppState();
                // Navigator.of(context).popUntil((route) => route.isFirst);
                // tabProvider.tabChangeIndex(index: 0);

                logOutBottomSheet(context);
              },
              isLoading: false,
              btnText: "Logout",
              textStyle: CustomTextStyle.headerFont16Style,
            ),
          ],
        ),
      )
    );
  }

  logOutBottomSheet(BuildContext context){
    final lendingProvider = context.read<LendingProvider>();

    final tabProvider = context.read<BottomNavProvider>();
    customBottomSheet(context,
      builder: (context) {
        final profileProvider = context.watch<AuthProvider>();
        final isLoading = profileProvider.logOutResponse.state == Status.LOADING;
        return CustomDialogWidget(
          title: "Logout",
          message: "Are you sure you want to logout?",
          primaryBtnTxt: "Yes",
          secondaryBtnTxt: "Cancel",
          primaryLoader:  isLoading,
          primaryAction: ()async{
            final navigator = Navigator.of(context);
            try {
              await context.read<AuthProvider>().logOut();
              lendingProvider.clearAppState();
              navigator.popUntil((route) => route.isFirst);
              tabProvider.tabChangeIndex(index: 0);
            } catch (e) {
              print(e);
            }
          },
          secondaryAction: (){},
        );
      },);
  }
}
