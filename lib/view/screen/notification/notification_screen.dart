import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                    child: Text("Notification",
                      textAlign: TextAlign.center,
                      style: montserratSamiBold.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.05),),
                  ),
                  SizedBox(width: AppConstants.itemWidth*0.03,),
                ],
              ),
              Expanded(child: Container(
                width: AppConstants.itemWidth,
                decoration: BoxDecoration(
                    color: ColorResources.WHITE.withOpacity(0.3),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConstants.itemWidth*0.1),topRight: Radius.circular(AppConstants.itemWidth*0.1))
                ),
                margin: EdgeInsets.only(top:AppConstants.itemWidth*0.05),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: AppConstants.itemWidth*0.05,),
                      Row(
                        children: [
                          SizedBox(width: AppConstants.itemWidth*0.03+5,),
                          Expanded(
                            child: Text("New",
                              textAlign: TextAlign.left,
                              style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.05),),
                          ),
                          SizedBox(width: AppConstants.itemWidth*0.03,),
                        ],
                      ),
                      ListView.builder(
                        padding: EdgeInsets.only(right: AppConstants.itemWidth*0.03,left: AppConstants.itemWidth*0.03,),
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.01,vertical: AppConstants.itemHeight*0.01),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5),
                                      child: Image.asset(Images.ic_notification,width: 25,height: 25,color: ColorResources.COLOR_PRIMERY,),
                                    ),
                                    SizedBox(width: AppConstants.itemWidth*0.03,),
                                    Expanded(child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text('${dayGetFromDate("2023-05-12 12:21:10")}',
                                                style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.04,color: ColorResources.BLACK),),
                                            ),
                                            Text('13 min ago',
                                              style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.04,color: ColorResources.BLACK),),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text("Lorem Ipsum is simply dummy",
                                                style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.04,color: Color(0xff6D6D6D)),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),),
                                  ],
                                ),
                                Divider(thickness: 1,)
                              ],
                            ),
                          );
                        },),
                      SizedBox(height: AppConstants.itemWidth*0.05,),
                      Row(
                        children: [
                          SizedBox(width: AppConstants.itemWidth*0.03+5,),
                          Expanded(
                            child: Text("Earlier",
                              textAlign: TextAlign.left,
                              style: montserratMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.05),),
                          ),
                          SizedBox(width: AppConstants.itemWidth*0.03,),
                        ],
                      ),
                      ListView.builder(
                        padding: EdgeInsets.only(right: AppConstants.itemWidth*0.03,left: AppConstants.itemWidth*0.03,),
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.01,vertical: AppConstants.itemHeight*0.01),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5),
                                      child: Image.asset(Images.ic_notification,width: 25,height: 25,color: ColorResources.COLOR_PRIMERY,),
                                    ),
                                    SizedBox(width: AppConstants.itemWidth*0.03,),
                                    Expanded(child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text('${dayGetFromDate("2023-05-12 12:21:10")}',
                                                style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.04,color: ColorResources.BLACK),),
                                            ),
                                            Text('13 min ago',
                                              style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.04,color: ColorResources.BLACK),),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text("Lorem Ipsum is simply dummy",
                                                style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.04,color: Color(0xff6D6D6D)),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),),
                                  ],
                                ),
                                Divider(thickness: 1,)
                              ],
                            ),
                          );
                        },),
                    ],
                  ),
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }

  dayGetFromDate(String date){
    DateTime parseDate =
    DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd MMM yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}