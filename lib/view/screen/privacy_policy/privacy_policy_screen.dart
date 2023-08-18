import 'package:flutter/material.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

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
                    child: Text("Privacy Policy",
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
                    children: [
                      SizedBox(height: AppConstants.itemWidth*0.08,),
                      const Expanded(
                        child: Text("Privacy Policy",
                          style: montserratMedium,
                        ),
                      ),
                      SizedBox(height: AppConstants.itemWidth*0.08,),
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
