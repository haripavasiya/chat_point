import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../dashboard/dashboard_screen.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../terms_condition/terms_condition_screen.dart';

class Sign_Up_Screen extends StatefulWidget {
  Sign_Up_Screen({Key? key}) : super(key: key);

  @override
  State<Sign_Up_Screen> createState() => _Sign_Up_ScreenState();
}

class _Sign_Up_ScreenState extends State<Sign_Up_Screen> {

  TextEditingController nameControll=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode nameFocus = FocusNode();
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorResources.COLOR_PRIMERY;
      }
      return ColorResources.COLOR_PRIMERY;
    }
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: AppConstants.itemHeight*0.15,),
            //App logo
            Image.asset(Images.logo,width: AppConstants.itemWidth*0.55,height: AppConstants.itemWidth*0.09,fit: BoxFit.fill,),
            SizedBox(height: AppConstants.itemHeight*0.05,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign up",style: montserratSamiBold.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.055),),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Lorem Ipsum is simply dummy text of the printing",style: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.5),fontSize: AppConstants.itemWidth*0.035),),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.02,),

            //name
            Container(
                margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                decoration: BoxDecoration(
                    color: ColorResources.WHITE,
                    borderRadius:BorderRadius.circular(5),
                    border: Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                ),
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Image.asset(Images.ic_user,width: 25,height: 25,color: ColorResources.BLACK,),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(child: TextFormField(
                      controller: nameControll,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      focusNode: nameFocus,
                      keyboardType: TextInputType.number,
                      initialValue: null,
                      textInputAction: TextInputAction.next,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                        isDense: true,
                        counterText: '',
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                        errorStyle: const TextStyle(height: 1.5),
                        border: InputBorder.none,
                      ),
                    )),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                  ],
                )
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),

            //email
            Container(
                margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                decoration: BoxDecoration(
                    color: ColorResources.WHITE,
                    borderRadius:BorderRadius.circular(5),
                    border: Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                ),
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Image.asset(Images.ic_email,width: 25,height: 25,color: ColorResources.BLACK,),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(child: TextFormField(
                      controller: emailController,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      focusNode: emailFocus,
                      keyboardType: TextInputType.number,
                      initialValue: null,
                      textInputAction: TextInputAction.next,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                        isDense: true,
                        counterText: '',
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                        errorStyle: const TextStyle(height: 1.5),
                        border: InputBorder.none,
                      ),
                    )),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                  ],
                )
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),

            //password
            Container(
                margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                decoration: BoxDecoration(
                    color: ColorResources.WHITE,
                    borderRadius:BorderRadius.circular(5),
                    border: Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                ),
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Image.asset(Images.ic_password,width: 25,height: 25,color: ColorResources.BLACK,),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(child: TextFormField(
                      controller: passwordController,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      focusNode: passwordFocus,
                      keyboardType: TextInputType.text,
                      initialValue: null,
                      textInputAction: TextInputAction.done,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                        isDense: true,
                        counterText: '',
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                        errorStyle: const TextStyle(height: 1.5),
                        border: InputBorder.none,
                      ),
                    )),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                  ],
                )
            ),

            SizedBox(height: AppConstants.itemHeight*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child:  RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "By signing you agree to our ",
                        style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.028,color: ColorResources.BLACK)),

                    TextSpan(
                      text: "Privacy Policy",
                      style: montserratMedium.copyWith( fontSize: AppConstants.itemWidth*0.028,color: ColorResources.COLOR_PRIMERY),
                      recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context,MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen(),)),
                    ),

                    TextSpan(
                      text: " and ",
                      style: montserratRegular.copyWith( fontSize: AppConstants.itemWidth*0.028,color: ColorResources.BLACK),),

                    TextSpan(
                      text: "Terms of use",
                      style: montserratMedium.copyWith( fontSize: AppConstants.itemWidth*0.028,color: ColorResources.COLOR_PRIMERY),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),));
              },
              child: Container(
                width: AppConstants.itemWidth,
                margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02,horizontal: AppConstants.itemWidth*0.05),
                padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.035),
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_PRIMERY,
                  borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.02),
                ),
                child: Text("Sign Up",textAlign: TextAlign.center,style: montserratMedium.copyWith(color: ColorResources.WHITE,fontSize: AppConstants.itemWidth*0.04)),
              ),
            ),
            SizedBox(height: AppConstants.itemHeight*0.005,),

            //Create Account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text("Sign in",style: montserratMedium.copyWith(color: ColorResources.COLOR_PRIMERY,fontSize: AppConstants.itemWidth*0.035),))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
