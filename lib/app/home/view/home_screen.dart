import 'package:flutter/material.dart';
import 'package:medpg/app/auth/view_model/auth_provider.dart';
import 'package:medpg/app/bottom_nav/custom_widget/custom_appbar.dart';
import 'package:medpg/app/home/view_model/home_provider.dart';
import 'package:medpg/utils/utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      final homeProvider = context.read<HomeProvider>();
      try{
        await homeProvider.getRecommendCall();
      }catch(e){
        print("$e==getRecommendCall");
      }

      try {
        await homeProvider.notificationCall();
      } catch (e) {
        print(e);
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final homeProvider = context.watch<HomeProvider>();
    final notiLoader = homeProvider.notificationAppResponse.state == Status.LOADING;
    final userLoader = authProvider.userResponse.state == Status.LOADING;
    final csrfLoader = authProvider.csrfResponse.state == Status.LOADING;
    final getRecommendLoader = homeProvider.getRecommendAppResponse.state == Status.LOADING;
    final userData = authProvider.userResponse.data;
    final getRecommendData = homeProvider.getRecommendAppResponse.data;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.sp),
        child: CustomAppbar()
      ),
      body: userLoader || notiLoader || csrfLoader || getRecommendLoader ?
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CircularProgressIndicator(color:kPrimaryColor)
        ],),
      ):
      Padding(
        padding: EdgeInsets.only(left: 20.sp,right: 20.sp,top: 20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome, ${userData?.displayName ?? "-"}",style: CustomTextStyle.boldFont18Style.copyWith(fontSize: 20.sp),),
            Text("Preparing for, ${userData?.targetExam ?? "-"}",style: CustomTextStyle.mediumFont18Style.copyWith(fontSize: 16.sp),),

            SizedBox(height: 10.sp),
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          spacing: 7.sp,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(12.sp),
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(8.sp),
                                    border: Border.all(color: Colors.grey.shade400)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Questions",style: CustomTextStyle.mediumFont18Style.copyWith(fontSize: 16.sp)),
                                    Text("4",style: CustomTextStyle.boldFont18Style.copyWith(fontSize: 18.sp)),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(12.sp),
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(8.sp),
                                    border: Border.all(color: Colors.grey.shade400)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Accuracy",style: CustomTextStyle.mediumFont18Style.copyWith(fontSize: 16.sp)),
                                    Text("50%",style: CustomTextStyle.boldFont18Style.copyWith(fontSize: 18.sp)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                
                        SizedBox(height: 7.sp),
                
                        Row(
                          spacing: 7.sp,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(12.sp),
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(8.sp),
                                    border: Border.all(color: Colors.grey.shade400)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Sessions",style: CustomTextStyle.mediumFont18Style.copyWith(fontSize: 16.sp)),
                                    Text("7",style: CustomTextStyle.boldFont18Style.copyWith(fontSize: 18.sp)),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(12.sp),
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(8.sp),
                                    border: Border.all(color: Colors.grey.shade400)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Strong Subject",style: CustomTextStyle.mediumFont18Style.copyWith(fontSize: 16.sp)),
                                    Text("3",style: CustomTextStyle.boldFont18Style.copyWith(fontSize: 18.sp)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                
                    SizedBox(height: 10.sp),
                
                    Text("Recommended For You ",style: CustomTextStyle.boldFont18Style.copyWith(fontSize: 16.sp),),
                
                    SizedBox(height: 10.sp),
                
                    Column(
                      children: List.generate(getRecommendData?.length ?? 0,(index) {
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(12.sp),
                          margin: EdgeInsets.symmetric(vertical: 3.sp),
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(8.sp),
                              border: Border.all(color: Colors.grey.shade400)
                          ),
                          child: Row(
                            spacing: 20.sp,
                            children: [
                              Icon(Icons.monitor_heart,color: kPrimaryColor),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(getRecommendData?[index].subject ?? "-",style: CustomTextStyle.boldFont18Style.copyWith(fontSize: 18.sp)),
                                    Text(getRecommendData?[index].topic ?? "-",style: CustomTextStyle.mediumFont18Style.copyWith(fontSize: 16.sp)),

                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(4.sp),

                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                                child: Text("Practice",style: CustomTextStyle.regularFont16Style.copyWith(color: kPrimaryColor),),
                              )
                            ],
                          ),
                        );
                      },),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
