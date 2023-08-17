import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:chat_point/model/doctor_model.dart';
import 'package:chat_point/view/baseview/button/custom_button.dart';
import 'package:chat_point/view/screen/appointment/appointment_screen.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class DoctorDetailsScreen extends StatefulWidget {
  DoctorModel doctorList;
  DoctorDetailsScreen(this.doctorList,{Key? key}) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_PRIMERY,
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_PRIMERY,
        automaticallyImplyLeading: false,
        elevation: 1,
        centerTitle: true,
        actionsIconTheme: const IconThemeData(color: ColorResources.WHITE),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Icon(Icons.arrow_back,color: ColorResources.WHITE,size: 24,)),
        ),
        title: Text("Doctor Details",
            textAlign: TextAlign.center,
            maxLines: 1,
            style: montserratMedium.copyWith(
                color: ColorResources.WHITE,
                fontSize: AppConstants.itemWidth*0.04)),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppConstants.itemHeight*0.08),
            child: Column(
              children: [
                Expanded(child: Container(
                  width: AppConstants.itemWidth,
                  decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConstants.itemWidth*0.1),topRight: Radius.circular(AppConstants.itemWidth*0.1))
                  ),
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: AppConstants.itemHeight*0.11),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text("${widget.doctorList.name}",
                                  textAlign: TextAlign.center,
                                  style: montserratMedium.copyWith(color:ColorResources.BLACK,
                                      fontSize: AppConstants.itemWidth*0.045)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text("${widget.doctorList.category}",
                                  textAlign: TextAlign.center,
                                  style: montserratRegular.copyWith(color:ColorResources.BLACK,
                                      fontSize: AppConstants.itemWidth*0.04)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer_outlined,color: ColorResources.BLACK.withOpacity(0.7),size: 18,),
                            SizedBox(width: AppConstants.itemWidth*0.01,),
                            Text("${widget.doctorList.time}",
                                textAlign: TextAlign.center,
                                style: montserratLight.copyWith(color:ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth*0.035)),
                          ],
                        ),
                        SizedBox(height: AppConstants.itemHeight*0.03,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffEDEEFF),
                                borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03)
                              ),
                              padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Image.asset(Images.ic_chat,width: 25,height: 25,color: ColorResources.COLOR_PRIMERY,),
                                  ),
                                  SizedBox(width: AppConstants.itemWidth*0.02,),
                                  Text("Chat",
                                      textAlign: TextAlign.center,
                                      style: montserratMedium.copyWith(color:ColorResources.COLOR_PRIMERY,
                                          fontSize: AppConstants.itemWidth*0.035)),
                                ],
                              ),
                            )),
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                            Expanded(child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffE7F8EF),
                                  borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03)
                              ),
                              padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Image.asset(Images.ic_call,width: 25,height: 25,color: ColorResources.GREEN,),
                                  ),
                                  SizedBox(width: AppConstants.itemWidth*0.02,),
                                  Text("Call",
                                      textAlign: TextAlign.center,
                                      style: montserratMedium.copyWith(color:ColorResources.GREEN,
                                          fontSize: AppConstants.itemWidth*0.035)),
                                ],
                              ),
                            )),
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                            Expanded(child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFF8ED),
                                  borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03)
                              ),
                              padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Image.asset(Images.ic_video,width: 25,height: 25,color: ColorResources.ORANGE,),
                                  ),
                                  SizedBox(width: AppConstants.itemWidth*0.02,),
                                  Text("Video",
                                      textAlign: TextAlign.center,
                                      style: montserratMedium.copyWith(color:ColorResources.ORANGE,
                                          fontSize: AppConstants.itemWidth*0.035)),
                                ],
                              ),
                            ))
                          ],
                        ),
                        SizedBox(height: AppConstants.itemHeight*0.03,),
                        Container(
                          decoration: BoxDecoration(
                              color: ColorResources.WHITE,
                              borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03),
                            boxShadow: [
                              BoxShadow(
                                color: ColorResources.BLACK.withOpacity(0.1),
                                blurRadius: 1
                              )
                            ]
                          ),
                          padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffCBCBCB).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03)
                                ),
                                padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("100",
                                        textAlign: TextAlign.center,
                                        style: montserratMedium.copyWith(color:ColorResources.BLACK,
                                            fontSize: AppConstants.itemWidth*0.035)),
                                    SizedBox(width: AppConstants.itemWidth*0.02,),
                                    Text("Runing",
                                        textAlign: TextAlign.center,
                                        style: montserratRegular.copyWith(color:ColorResources.BLACK.withOpacity(0.5),
                                            fontSize: AppConstants.itemWidth*0.035)),
                                  ],
                                ),
                              )),
                              SizedBox(width: AppConstants.itemWidth*0.03,),
                              Expanded(child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffCBCBCB).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03)
                                ),
                                padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("500",
                                        textAlign: TextAlign.center,
                                        style: montserratMedium.copyWith(color:ColorResources.BLACK,
                                            fontSize: AppConstants.itemWidth*0.035)),
                                    SizedBox(width: AppConstants.itemWidth*0.02,),
                                    Text("Ongoing",
                                        textAlign: TextAlign.center,
                                        style: montserratRegular.copyWith(color:ColorResources.BLACK.withOpacity(0.5),
                                            fontSize: AppConstants.itemWidth*0.035)),
                                  ],
                                ),
                              )),
                              SizedBox(width: AppConstants.itemWidth*0.03,),
                              Expanded(child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffCBCBCB).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03)
                                ),
                                padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("700",
                                        textAlign: TextAlign.center,
                                        style: montserratMedium.copyWith(color:ColorResources.BLACK,
                                            fontSize: AppConstants.itemWidth*0.035)),
                                    SizedBox(width: AppConstants.itemWidth*0.02,),
                                    Text("Patient",
                                        textAlign: TextAlign.center,
                                        style: montserratRegular.copyWith(color:ColorResources.BLACK.withOpacity(0.5),
                                            fontSize: AppConstants.itemWidth*0.035)),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height: AppConstants.itemHeight*0.02,),

                        // Our Category
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text("About",
                                    style: montserratMedium.copyWith(
                                      color: ColorResources.BLACK,
                                      fontSize: AppConstants.itemWidth*0.045,
                                    )),
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                    textAlign: TextAlign.justify,
                                    style: montserratRegular.copyWith(
                                      color: const Color(0xff6D6D6D),
                                      fontSize: AppConstants.itemWidth*0.045,
                                    )),
                              ),
                            ]),
                        SizedBox(height: AppConstants.itemHeight*0.02,),

                        // Services
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text("Services",
                                    style: montserratMedium.copyWith(
                                      color: ColorResources.BLACK,
                                      fontSize: AppConstants.itemWidth*0.045,
                                    )),
                              ),
                            ]),
                        SizedBox(height: AppConstants.itemHeight*0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: "1.",
                                    style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),

                                TextSpan(
                                    text: "Your parking booking was conformed.",
                                    style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),
                              ]),
                            ),),
                          ],
                        ),
                        const Divider(thickness: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: "2.",
                                    style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),

                                TextSpan(
                                    text: "Take Screen Shot and showing at the parking slot.",
                                    style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),
                              ]),
                            ),),
                          ],
                        ),
                        const Divider(thickness: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "3.",
                                        style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),

                                    TextSpan(
                                        text: "If you are not coming at your booking time then you paying cancellation charge \$ 2.50.",
                                        style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),
                                  ]),
                            ),),
                          ],
                        ),
                        const Divider(thickness: 1,),
                        GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentScreen(),)),
                            child: const CustomButton("Book an Appointment")),
                      ],
                    ),
                  ),
                ),),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.itemHeight*0.18),
                child: CachedNetworkImage(
                  height: AppConstants.itemHeight*0.18,
                  imageUrl:widget.doctorList.imageUrl,
                  errorWidget: (context, url, error) => Image.asset(Images.placeholderImages,height: AppConstants.itemHeight*0.1,width: AppConstants.itemHeight*0.15,),
                  progressIndicatorBuilder: (context, url, downloadProgress) => const Center(child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),),
                  fit: BoxFit.cover,
                  width: AppConstants.itemHeight*0.18,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
