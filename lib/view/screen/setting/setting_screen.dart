import 'dart:io';

import 'package:chat_point/view/screen/gallery/gallery_screen.dart';
import 'package:chat_point/view/screen/setting/widget/account_screen.dart';
import 'package:chat_point/view/screen/setting/widget/chat_setting_screen.dart';
import 'package:chat_point/view/screen/setting/widget/help_screen.dart';
import 'package:chat_point/view/screen/setting/widget/notifications_setting_screen.dart';
import 'package:chat_point/view/screen/setting/widget/privacy_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../notification/notification_screen.dart';
import '../search/search_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.TRANSPARENT,
      body: SafeArea(
        child: Container(
          color: ColorResources.TRANSPARENT,
          child: Column(
            children: [
              SizedBox(height: AppConstants.itemWidth*0.02,),
              Row(
                children: [
                  SizedBox(width: AppConstants.itemWidth*0.03,),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),)),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(Images.ic_search,width: 25,height: 25,),
                    ),
                  ),

                  Expanded(
                    child: Text("Settings",
                      textAlign: TextAlign.center,
                      style: montserratSamiBold.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.05),),
                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen(),)),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(Images.ic_notification,width: 25,height: 25,color: ColorResources.BLACK),
                    ),
                  ),
                  SizedBox(width: AppConstants.itemWidth*0.03,),
                ],
              ),
              Expanded(child: Container(
                width: AppConstants.itemWidth,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffFFFFFF).withOpacity(0.2),
                        Color(0xffFFDFFC),
                      ],
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConstants.itemWidth*0.1),topRight: Radius.circular(AppConstants.itemWidth*0.1))
                ),
                padding: EdgeInsets.only(bottom: 110),
                margin: EdgeInsets.only(top:AppConstants.itemWidth*0.1),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(right: AppConstants.itemWidth*0.03,left: AppConstants.itemWidth*0.03),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: AppConstants.itemWidth*0.07,),

                    Padding(
                      padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountScreen(),)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Account",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.BLACK,size: 20,),
                          ],
                        ),
                      ),
                    ),
                    const Divider(thickness: 1),

                    Padding(
                      padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatSettingScreenScreen(),)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Chats",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.BLACK,size: 20,),
                          ],
                        ),
                      ),
                    ),
                    const Divider(thickness: 1),

                    Padding(
                      padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationSettingScreenScreen(),)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Notifications",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.BLACK,size: 20,),
                          ],
                        ),
                      ),
                    ),
                    const Divider(thickness: 1),

                    Padding(
                      padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacySettingScreenScreen(),)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Privacy",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.BLACK,size: 20,),
                          ],
                        ),
                      ),
                    ),
                    const Divider(thickness: 1),

                    Padding(
                      padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const GalleryScreen(),)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Gallery",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.BLACK,size: 20,),
                          ],
                        ),
                      ),
                    ),
                    const Divider(thickness: 1),

                    Padding(
                      padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpScreen(),)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Help",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.BLACK,size: 20,),
                          ],
                        ),
                      ),
                    ),
                    const Divider(thickness: 1),
                  ],
                ),),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
