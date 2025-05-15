import '../../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../home/view_model/home_provider.dart';
import '../../auth/view_model/auth_provider.dart';
import 'package:medpg/app/home/view/home_screen.dart';
import 'package:medpg/app/mocks/view/mocks_screen.dart';
import 'package:medpg/app/practice/view/practice_screen.dart';
import 'package:medpg/app/progress/view/progress_screen.dart';
import 'package:medpg/app/revise/view/revise_screen.dart';
import 'package:medpg/app/bottom_nav/view_model/bottom_nav_provider.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      final authProvider = context.read<AuthProvider>();
      try{
        await authProvider.ensureValidCsrfToken();
        await authProvider.getUser();
      }catch(e){
        print("${e}");
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    final tabProvider = context.watch<BottomNavProvider>();
    final currentIndex = tabProvider.currentIndex;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          PracticeScreen(),
          MocksScreen(),
          ProgressScreen(),
          ReviseScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100.sp,
        // padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 16.sp),
        decoration: BoxDecoration(
            color: kWhiteColor,
        ),
        child: Column(
          children: [
            Row(
              children: List.generate(tabList.length, (index) {
                final tabData = tabList[index];
                final isSelected = currentIndex == index;
                return InkWell(
                  onTap: (){
                    final tabProvider = context.read<BottomNavProvider>();
                    tabProvider.tabChangeIndex(index: index);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            height: 2.sp,
                            color: isSelected ? kPrimaryColor : Colors.transparent
                        ),

                        SizedBox(
                          height: 10.sp,
                        ),


                        SizedBox(
                            height: 24.sp,
                            width: 24.sp,
                            child: SvgPicture.asset(tabData.icon ?? "",
                              colorFilter: ColorFilter.mode(
                                  isSelected ? kPrimaryColor:
                                  Color(0xff64748b),
                                  BlendMode.srcIn),
                            )),

                        SizedBox(
                          height: 10.sp,
                        ),

                        Flexible(child: Text(tabData.name ?? "",style: TextStyle(
                            color: isSelected ? kPrimaryColor:
                            Color(0xff64748b),
                            fontSize: isSelected ? 14.sp : 14.sp,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w600
                        ),))
                      ],),
                  ),
                );
              }),
            ),
            SizedBox(height: 20.sp),
          ],
        ),
      ),
    );
  }
}

class TabModel{
  String icon;
  String name;

  TabModel({required this.icon, required this.name});
}

List<TabModel> tabList = [
  TabModel(icon: "assets/icons/home.svg", name: "Home"),
  TabModel(icon: "assets/icons/practice.svg", name: "Practice"),
  TabModel(icon: "assets/icons/mocks.svg", name: "Mocks"),
  TabModel(icon: "assets/icons/progress.svg", name: "Progress"),
  TabModel(icon: "assets/icons/revise.svg", name: "Revise"),
];

