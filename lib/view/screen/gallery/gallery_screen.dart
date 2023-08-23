import 'package:flutter/material.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {

  String selectType="Images";

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
                    child: Text("Gallery",
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
                child: Column(
                  children: [
                    SizedBox(height: AppConstants.itemWidth*0.05,),
                    Row(
                      children: [
                        Expanded(child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectType="Images";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectType=="Images"?ColorResources.COLOR_PRIMERY:ColorResources.WHITE,
                              borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.02),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.035),
                            padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                            alignment: Alignment.center,
                            child: Text("Images",style: montserratRegular.copyWith(color: selectType=="Images"?ColorResources.WHITE:ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),),
                          ),
                        )),
                        Expanded(child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectType="Videos";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectType=="Videos"?ColorResources.COLOR_PRIMERY:ColorResources.WHITE,
                              borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.02),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.035),
                            padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                            alignment: Alignment.center,
                            child: Text("Videos",style: montserratRegular.copyWith(color: selectType=="Videos"?ColorResources.WHITE:ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
