import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medpg/app/auth/domin/request/login_req_model.dart';
import 'package:medpg/app/auth/route/auth_route.dart';
import 'package:medpg/app/leading/view_model/leanding_provider.dart';
import 'package:medpg/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../../base/base_components/custom_button.dart';
import '../../../base/base_components/custom_rounded_textfield.dart';
import '../../../base/base_components/toaster_msg.dart';
import '../../leading/route/leading_route.dart';
import '../view_model/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isCheck = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final isLoginLoader = authProvider.loginAppResponse.state == Status.LOADING;
    final crsfLoader = authProvider.csrfResponse.state == Status.LOADING;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.sp),
        child: AppBar(
          backgroundColor: kWhiteColor,
          leadingWidth: 150.sp,
          leading: Row(
            children: [
              SizedBox(width: 20.sp),
              SizedBox(
                height: 70.sp,
                  width: 70.sp,
                  child: Image.asset("assets/images/themedico-logo.png",
                    fit: BoxFit.cover,)
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                Text("Powered by ",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 16.sp)),
                Image.asset("assets/images/medpgText-logo.jpg"),
                SizedBox(width: 10.sp),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 20.sp),
                margin: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 20.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),
                  color: kWhiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20.sp,
                  children: [
                    Text("Welcome back",style: CustomTextStyle.boldFont22Style.copyWith(color: kBlackColor,fontSize: 30.sp),),

                    Text("Sign in to continue your medical exam preparation journey",
                        style: CustomTextStyle.mediumFont18Style),

                    CustomRoundedTextField(
                      headerText: "Username / Email or phone",
                      maxLength: 50,
                      controller: emailController,
                      hint: "Enter your email address",
                      isOptional: false,
                      isEnable: true,
                      inputType: TextInputType.text,
                      name: "email address",
                      textInputAction: TextInputAction.next,
                      // regex: StringValidation.emailValidation,
                    ),

                    CustomRoundedTextField(
                      headerText: "Password",
                      maxLength: 50,
                      controller: passwordController,
                      hint: "Enter your password",
                      isOptional: false,
                      isEnable: true,
                      isSecure: true,
                      maxLine: 1,
                      regex: StringValidation.passwordValidation,
                      inputType: TextInputType.text,
                      name: "password",
                      textInputAction: TextInputAction.next,
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("Forgot Password",
                        style: TextStyle(
                            color: Color(0xff0077cc),
                            fontWeight: FontWeight.w600,
                            fontSize: kFont_16
                        ),
                      ),
                    ),

                    CustomButton(

                      onTap: ()async{
                        FocusManager.instance.primaryFocus?.unfocus();

                        HapticFeedback.heavyImpact();

                        final isFormValid = _formKey.currentState?.validate();

                        final navigation = Navigator.of(context);

                        final authProvider = context.read<AuthProvider>();
                        final lendingProvider = context.read<LendingProvider>();

                        if(isFormValid == false) return;

                        try {
                          await authProvider.ensureValidCsrfToken();

                          await authProvider.login(
                            loginReqModel: LoginReqModel(credential: emailController.text,password: passwordController.text),
                          );

                          final loginData = authProvider.loginAppResponse.data?.user;

                          await lendingProvider.setAppState(state:
                              AppState(isLogin: true ,
                                  userID: loginData?.id.toString(),
                                // token: data?.csrfToken,
                              ));

                          // navigation.pushReplacementNamed(BottomNavRoute.route);

                          await UserPrefs().setIsLogin(isLogin: true);

                          navigation.pushNamedAndRemoveUntil(LendingRoute.route,(route) => false);

                          Toaster.showMessage(context, msg: "Login Successfully !! ",isError: false);

                        } catch (e) {
                          print("e === ${e}");
                          Toaster.showMessage(context, msg: "${e}");
                        }

                      },
                      isLoading: isLoginLoader || crsfLoader,
                      btnText: "Sign In",
                    ),

                    Row(
                      children: [
                        Expanded(child: Divider(height: 1)),
                        SizedBox(width: 10.sp),
                        Text("New to MEDICO?",style: CustomTextStyle.regularFont16Style,),
                        SizedBox(width: 10.sp),
                        Expanded(child: Divider(height: 1)),
                      ],
                    ),

                    CustomButton(
                      isBorder: true,
                      btnColor: Colors.transparent,
                      onTap:(){
                        AuthRoute.goToRegisterPage(context);
                      },
                      isLoading: false,
                      btnText: "Create an account",
                      textStyle: CustomTextStyle.headerFont16Style,
                    ),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'By signing up you are agreeing with the FFE ',
                            style: TextStyle(
                                color: Color(0xff343131),
                                fontWeight: FontWeight.w400,
                                fontSize: kFont_14
                            ),
                          ),
                          TextSpan(
                            text: 'Terms & Conditions ',
                            style: TextStyle( color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: kFont_14),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: TextStyle( color: Color(0xff343131),
                                fontWeight: FontWeight.w400,
                                fontSize: kFont_14),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle( color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: kFont_14),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Powered by ",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 12.sp)),
                        SizedBox(
                          height: 50.sp,
                            child: Image.asset("assets/images/medpgText-logo.jpg")),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
