import 'package:flutter/material.dart';
import 'package:chat_point/view/screen/dashboard/dashboard_screen.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/button/custom_button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop:() async{
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),));
          return true;
        },
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                  width: AppConstants.itemWidth,
                  decoration: const BoxDecoration(
                      color: ColorResources.WHITE
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffEFF0FD),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(AppConstants.itemWidth*0.1),
                        child: Image(
                          image: const AssetImage(Images.ic_like),
                          width: AppConstants.itemWidth * 0.3,
                          height: AppConstants.itemWidth * 0.3,
                        ),
                      ),
                      Text("Thank You !".toUpperCase(), style: montserratMedium.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth*0.06,
                          fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height: AppConstants.itemWidth*0.05,),
                      Text("Your Appointment Successful", style: montserratMedium.copyWith(
                          fontSize: AppConstants.itemWidth*0.045,
                          color: ColorResources.BLACK,
                          fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: AppConstants.itemWidth*0.05,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.03),
                        child: Text("You booked an appointment with Dr.\nPediatrician Purpieson on February 21,\nat 02:00 PM",
                          textAlign: TextAlign.center,
                          style: montserratMedium.copyWith(
                            fontSize: AppConstants.itemWidth*0.04,
                            color: ColorResources.BLACK.withOpacity(0.5),
                            fontWeight: FontWeight.w500
                        ),),
                      ),
                      SizedBox(height: AppConstants.itemWidth*0.05,),
                      GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DashboardScreen(),
                              )),
                          child: const CustomButton("Done")),
                      SizedBox(height: AppConstants.itemWidth*0.05,),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardScreen(),
                            )),
                        child: Text("Go to Home", style: montserratMedium.copyWith(
                            fontSize: AppConstants.itemWidth*0.04,
                            color: ColorResources.COLOR_PRIMERY,
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
