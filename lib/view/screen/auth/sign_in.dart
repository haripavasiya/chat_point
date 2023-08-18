import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/button/custom_button.dart';
import '../dashboard/dashboard_screen.dart';
import '../otp/otp_screen.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../terms_condition/terms_condition_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController phoneControll=TextEditingController();
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AppConstants.itemHeight,
        width: AppConstants.itemWidth,
        decoration: const BoxDecoration(
            color: ColorResources.WHITE,
            image: DecorationImage(image: AssetImage(Images.splash_bg),fit: BoxFit.fill)
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppConstants.itemHeight*0.01,),
              //App logo
              Image.asset(Images.logo,width: AppConstants.itemWidth*0.4,height: AppConstants.itemWidth*0.4,fit: BoxFit.fill,),
              const SizedBox(height: 10,),
              //Fill Form
              Container(
                width: AppConstants.itemWidth,
                margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.02),
                child: Column(
                  children: [

                    Row(
                      children: [
                        Image.asset(Images.ic_phone,width: 25,height: 25,color: ColorResources.BLACK,),
                        Expanded(
                          child: TextFormField(
                            controller:phoneControll,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.number,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.done,
                            style: montserratRegular.copyWith(color: ColorResources.BLACK),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 10,
                            onChanged: (value) {
                              if(value.length==10){
                                AppConstants.closeKeyboard();
                              }
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: ColorResources.TRANSPARENT,
                                hintText: "Mobile Number",
                                hintStyle: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.8)),
                                filled: true,
                                counterText: ""
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(thickness: 1,height: 1,color: ColorResources.GREY),
                    SizedBox(height: AppConstants.itemWidth*0.03,),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.itemHeight*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child:  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[

                      TextSpan(
                          text: "By signing you agree to our ",
                          style: montserratRegular.copyWith( fontSize: 12,color: ColorResources.BLACK)),

                      TextSpan(
                        text: "Privacy Policy",
                        style: montserratMedium.copyWith( fontSize: 12,color: ColorResources.COLOR_PRIMERY),
                        recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context,MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen(),)),
                      ),

                      TextSpan(
                        text: " and ",
                        style: montserratRegular.copyWith( fontSize: 12,color: ColorResources.BLACK),),

                      TextSpan(
                        text: "Terms of use",
                        style: montserratMedium.copyWith( fontSize: 12,color: ColorResources.COLOR_PRIMERY),
                        recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context,MaterialPageRoute(builder: (context) => const TermsConditionScreen(),)),
                      ),
                    ]),
                  ),),
                ],
              ),
              SizedBox(height: AppConstants.itemHeight*0.02,),
              //Button
              GestureDetector(
                onTap:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const OTP_Screen(),));
                },
                child: const CustomButton("Log In"),
              ),
              SizedBox(height: AppConstants.itemHeight*0.005,),
            ],
          ),
        ),
      ),
    );
  }
}
