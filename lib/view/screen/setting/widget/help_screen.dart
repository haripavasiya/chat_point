import 'dart:io';

import 'package:chat_point/utill/app_constants.dart';
import 'package:chat_point/utill/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/styles.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

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
                    child: Text("Help",
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
                              child: Text("Help center",
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
                              child: Text("Contact us",
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
                              child: Text("Terms and privacy policy",
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
                              child: Text("App info",
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
