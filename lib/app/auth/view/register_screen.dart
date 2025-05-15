import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medpg/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../../base/base_components/custom_button.dart';
import '../../../base/base_components/custom_drop_down.dart';
import '../../../base/base_components/custom_rounded_textfield.dart';
import '../../leading/view_model/leanding_provider.dart';
import '../view_model/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController fullNameController;
  late TextEditingController userNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;
  late TextEditingController targetExamController;
  late TextEditingController examDateController;
  bool isCheck = false;
  final _formKey = GlobalKey<FormState>();

  final List<String> exams = ['NEET-PG', 'INI-CET', 'FMGE'];
  String selectedExam = 'NEET-PG';

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
    userNameController = TextEditingController();
    confirmPassController = TextEditingController();
    examDateController = TextEditingController();
    targetExamController = TextEditingController();
    fullNameController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
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
                  Text("Create your account",style: CustomTextStyle.boldFont22Style.copyWith(color: kBlackColor,fontSize: 30.sp),),

                  Text("Start your personalized medical exam preparation today",
                      style: CustomTextStyle.mediumFont18Style),

                  CustomRoundedTextField(
                    headerText: "Full Name",
                    maxLength: 50,
                    controller: fullNameController,
                    hint: "Dr.Full Name",
                    isOptional: false,
                    isEnable: true,
                    inputType: TextInputType.text,
                    name: "Dr.Full Name",
                    textInputAction: TextInputAction.next,
                  ),

                  CustomRoundedTextField(
                    headerText: "Username",
                    maxLength: 50,
                    controller: userNameController,
                    hint: "Dr.username",
                    isOptional: false,
                    isEnable: true,
                    inputType: TextInputType.text,
                    name: "Dr.username",
                    textInputAction: TextInputAction.next,
                  ),

                  CustomRoundedTextField(
                    headerText: "Email",
                    maxLength: 50,
                    controller: emailController,
                    hint: "Enter your email address",
                    isOptional: false,
                    isEnable: true,
                    inputType: TextInputType.text,
                    name: "Dr.username",
                    textInputAction: TextInputAction.next,
                    regex: StringValidation.emailValidation,
                  ),

                  CustomRoundedTextField(
                    headerText: "Phone",
                    maxLength: 50,
                    controller: phoneNumberController,
                    hint: "Enter your Phone Number",
                    isOptional: false,
                    isEnable: true,
                    inputType: TextInputType.text,
                    name: "phone number",
                    textInputAction: TextInputAction.next,
                    regex: StringValidation.emailValidation,
                  ),

                  CustomDropdown(
                    exam: exams,
                    selectExam: selectedExam,
                    onChanged:   (value) {
                      setState(() {
                        selectedExam = value;
                      });
                      },
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

                  CustomRoundedTextField(
                    headerText: "Confirm Password",
                    maxLength: 50,
                    controller: confirmPassController,
                    hint: "Enter your Confirm password",
                    isOptional: false,
                    isEnable: true,
                    isSecure: true,
                    maxLine: 1,
                    regex: StringValidation.passwordValidation,
                    inputType: TextInputType.text,
                    name: "password",
                    textInputAction: TextInputAction.next,
                  ),

                  CustomButton(
                    onTap: (){},
                    isLoading: false,
                    btnText: "Create Account",
                  ),

                  Text.rich(
                    textAlign: TextAlign.center,
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

                  Divider(height: 1,color: kTextFiledBorderColor),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have a themedico.app account",
                        style: TextStyle(
                            color: Color(0xff343131),
                            fontWeight: FontWeight.w400,
                            fontSize: kFont_16
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(4.sp),
                          child: Text("Sign in here",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: kFont_16
                            ),
                          ),
                        ),
                      ),
                    ],
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
    );
  }
}





