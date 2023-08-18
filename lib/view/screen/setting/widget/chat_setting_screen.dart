import 'package:flutter_switch/flutter_switch.dart';
import 'package:chat_point/utill/app_constants.dart';
import 'package:chat_point/utill/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/styles.dart';

class ChatSettingScreenScreen extends StatefulWidget {
  const ChatSettingScreenScreen({Key? key}) : super(key: key);

  @override
  State<ChatSettingScreenScreen> createState() => _ChatSettingScreenScreenState();
}

class _ChatSettingScreenScreenState extends State<ChatSettingScreenScreen> {
  bool _enterIsSend =false,_mediaVisibility =false,keepChatArchived =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xffB8D3FC),
                  Color(0xffFFDFFC),
                ],
              ),
              image: DecorationImage(image: AssetImage(Images.splash_bg),fit: BoxFit.fill)
          ),
          child: Column(
            children: [
              SizedBox(height: AppConstants.itemWidth*0.02,),
              Row(
                children: [
                  SizedBox(width: AppConstants.itemWidth*0.03,),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.arrow_back,size: 25,color: ColorResources.BLACK,),
                    ),
                  ),

                  Expanded(
                    child: Text("Chats",
                      textAlign: TextAlign.center,
                      style: montserratSamiBold.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.05),),
                  ),
                  SizedBox(width: AppConstants.itemWidth*0.03,),
                ],
              ),
              Expanded(child: Container(
                width: AppConstants.itemWidth,
                decoration: BoxDecoration(
                    color: ColorResources.WHITE.withOpacity(0.2),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConstants.itemWidth*0.1),topRight: Radius.circular(AppConstants.itemWidth*0.1))
                ),
                margin: EdgeInsets.only(top:AppConstants.itemWidth*0.1),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(right: AppConstants.itemWidth*0.03,left: AppConstants.itemWidth*0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: AppConstants.itemWidth*0.07,),

                      Padding(
                        padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Theme",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.BLACK,size: 20,),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),

                      Padding(
                        padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Wallpaper",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.BLACK,size: 20,),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),

                      Padding(
                        padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Enter is send",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            FlutterSwitch(
                              height: 18.0,
                              width: 40.0,
                              toggleSize: 15.0,
                              borderRadius: 10.0,
                              activeColor: ColorResources.GREEN.withOpacity(0.8),
                              value: _enterIsSend,
                              onToggle: (value) {
                                setState(() {
                                  _enterIsSend = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),

                      Padding(
                        padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Media visibility",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            FlutterSwitch(
                              height: 18.0,
                              width: 40.0,
                              toggleSize: 15.0,
                              borderRadius: 10.0,
                              activeColor: ColorResources.GREEN.withOpacity(0.8),
                              value: _mediaVisibility,
                              onToggle: (value) {
                                setState(() {
                                  _mediaVisibility = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),

                      Padding(
                        padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Font size",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.BLACK,size: 20,),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),

                      Padding(
                        padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Keep chat archived",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            FlutterSwitch(
                              height: 18.0,
                              width: 40.0,
                              toggleSize: 15.0,
                              borderRadius: 10.0,
                              activeColor: ColorResources.GREEN.withOpacity(0.8),
                              value: keepChatArchived,
                              onToggle: (value) {
                                setState(() {
                                  keepChatArchived = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),

                      Padding(
                        padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Chat backup",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.BLACK,size: 20,),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),

                      Padding(
                        padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Transfer chats",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.BLACK,size: 20,),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),

                      Padding(
                        padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Chat history",
                                textAlign: TextAlign.left,
                                style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.BLACK,size: 20,),
                          ],
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
