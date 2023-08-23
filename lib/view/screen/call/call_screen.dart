import 'package:chat_point/utill/color_resources.dart';
import 'package:chat_point/utill/images.dart';
import 'package:flutter/material.dart';

import '../../../model/message_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/styles.dart';

class CallScreen extends StatefulWidget {
  MessageModel messageUserList;
  CallScreen(this.messageUserList,{Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffCED9F9),
              Color(0xffE7D9F3),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  height: AppConstants.itemWidth * 0.3,
                  width: AppConstants.itemWidth * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(widget.messageUserList.imageUrl),fit: BoxFit.cover),
                      color: widget.messageUserList.color,
                      shape: BoxShape.circle,),
                ),
                SizedBox(
                  height: AppConstants.itemWidth * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.messageUserList.name,
                        style: montserratRegular.copyWith(
                            color: ColorResources.BLACK,
                            fontSize: AppConstants.itemWidth * 0.045))
                  ],
                ),
                SizedBox(
                  height: AppConstants.itemWidth * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Calling...",
                        style: montserratLight.copyWith(
                            color:
                            ColorResources.BLACK.withOpacity(0.5),
                            fontSize:
                            AppConstants.itemWidth * 0.035))
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      shape: BoxShape.circle,),
                  padding: EdgeInsets.all(AppConstants.itemWidth*0.05),
                  child: Image.asset(Images.ic_voice,
                    height: AppConstants.itemWidth * 0.07,
                    width: AppConstants.itemWidth * 0.07,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.035),
                    decoration: BoxDecoration(
                      color: Color(0xff3D8BF0),
                      shape: BoxShape.circle,),
                    padding: EdgeInsets.all(AppConstants.itemWidth*0.05),
                    child: Image.asset(Images.ic_videocamera,
                      height: AppConstants.itemWidth * 0.07,
                      width: AppConstants.itemWidth * 0.07,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF30000),
                      shape: BoxShape.circle,),
                    padding: EdgeInsets.all(AppConstants.itemWidth*0.05),
                    child: Image.asset(Images.ic_voice_call,
                      height: AppConstants.itemWidth * 0.07,
                      width: AppConstants.itemWidth * 0.07,
                    ),
                  ),
                ),
            ],
            ),
          ],
        ),
      ),
    );
  }
}
