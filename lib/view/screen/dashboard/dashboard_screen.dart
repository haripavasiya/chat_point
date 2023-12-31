import 'package:flutter/material.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../setting/setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int pageIndex=1;
  List<Widget> screenList=[];

  @override
  void initState() {
    super.initState();
    pageIndex=1;
    screenList=[
      const ProfileScreen(),
      const HomeScreen(),
      const SettingScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      body: Container(
        height: AppConstants.itemHeight,
        width: AppConstants.itemWidth,
        decoration: BoxDecoration(
            color: ColorResources.WHITE,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffB8D3FC),
              Color(0xffFFDFFC),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            screenList[pageIndex],
            Positioned(
              bottom: 0,
                child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 70,
                    width: AppConstants.itemWidth,
                    decoration: BoxDecoration(
                        color: Color(0xff3D8BF0).withOpacity(0.20),
                        borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.1)
                    ),
                    margin: EdgeInsets.only(bottom: AppConstants.itemWidth*0.035,left: AppConstants.itemWidth*0.035,right: AppConstants.itemWidth*0.035),
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
                    child: Row(
                      children: [
                        Expanded(child: GestureDetector(
                            onTap: () {
                              setState(() {
                                pageIndex=0;
                              });
                            },
                            child: Image.asset(Images.ic_user,height: AppConstants.itemWidth*0.07,width: AppConstants.itemWidth*0.07,))),
                        Expanded(child: SizedBox()),
                        Expanded(child: GestureDetector(
                            onTap: () {
                              setState(() {
                                pageIndex=2;
                              });
                            },
                            child: Image.asset(Images.ic_settings,height: AppConstants.itemWidth*0.07,width: AppConstants.itemWidth*0.07,))),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex=1;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(Images.ic_bg_chat_icon),fit: BoxFit.fill),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(AppConstants.itemWidth*0.035),
                        child: Image.asset(Images.ic_chat),
                      ),
                      Image.asset(Images.logoHorizontal,height: AppConstants.itemWidth*0.07,width: AppConstants.itemWidth*0.25,)
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}