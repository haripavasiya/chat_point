import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/doctor_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class MyAppointmentScreen extends StatefulWidget {
  const MyAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<MyAppointmentScreen> createState() => _MyAppointmentScreenState();
}

class _MyAppointmentScreenState extends State<MyAppointmentScreen> {

  List<DoctorModel> doctorList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctorList.add(DoctorModel("https://www.centura.org/sites/default/files/Smith.jpg", "Dr. Smith Mathew", "5:00 pm to 8:00 pm", "Cardiologist", "4.5"));
    doctorList.add(DoctorModel("https://www.muhealth.org/sites/default/files/providers/Smith_Matt.1518034404.jpg", "Dr. Jane Cooper", "5:00 pm to 8:00 pm", "Dentist", "2.5"));
    doctorList.add(DoctorModel("https://res.cloudinary.com/pcf/images/fl_lossy/f_auto,q_auto/v1674665357/Smith_Matthew_512x512_llz3zx_23878cb0f2/Smith_Matthew_512x512_llz3zx_23878cb0f2.jpg?_i=AA", "Dr. Merry An.", "5:00 pm to 8:00 pm", "Surgeon", "5.0"));
    doctorList.add(DoctorModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReEWzkxKeGgCTsGZVTPovavFR9wSbYytehZLhkT9ON-YviJSRzcSAfYB-D9o0ggkgLKD0&usqp=CAU", "Dr. John Walton", "5:00 pm to 8:00 pm", "Pathologist", "4.0"));
    doctorList.add(DoctorModel("https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg", "Dr. Harry Samit", "5:00 pm to 8:00 pm", "Radiology", "5.0"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      appBar: AppBar(
        backgroundColor: ColorResources.WHITE,
        automaticallyImplyLeading: false,
        elevation: 1,
        centerTitle: true,
        actionsIconTheme: const IconThemeData(color: ColorResources.WHITE),
        title: Text("My Appointment",
            textAlign: TextAlign.center,
            maxLines: 1,
            style: montserratMedium.copyWith(
                color: ColorResources.BLACK,
                fontSize: AppConstants.itemWidth*0.04)),
      ),
      body: ListView.builder(
        itemCount: doctorList.length,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.all(AppConstants.itemWidth*0.03),
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.05),
                  boxShadow: [
                    BoxShadow(
                        color: ColorResources.BLACK.withOpacity(0.2),
                        blurRadius: 1
                    )
                  ]
              ),
              margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02,horizontal: AppConstants.itemWidth*0.02),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.itemHeight*0.1),
                    child: CachedNetworkImage(
                      height: AppConstants.itemHeight*0.12,
                      imageUrl:doctorList[index].imageUrl,
                      errorWidget: (context, url, error) => Image.asset(Images.logo,height: AppConstants.itemHeight*0.1,width: AppConstants.itemHeight*0.15,),
                      progressIndicatorBuilder: (context, url, downloadProgress) => const Center(child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),),
                      fit: BoxFit.cover,
                      width: AppConstants.itemHeight*0.12,
                    ),
                  ),
                  SizedBox(width: AppConstants.itemWidth*0.02,),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text("${doctorList[index].name}",
                                style: montserratMedium.copyWith(color:ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth*0.045)),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,color: ColorResources.YELLOW.withOpacity(0.7),size:20,),
                              Text("${doctorList[index].rate}",
                                  style: montserratRegular.copyWith(color:Color(0xff6D6D6D),
                                      fontSize: AppConstants.itemWidth*0.035)),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text("${doctorList[index].category}",
                                style: montserratRegular.copyWith(color:ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth*0.04)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Row(
                            children: [
                              Icon(Icons.timer_outlined,color: ColorResources.BLACK.withOpacity(0.7),size: 18,),
                              SizedBox(width: AppConstants.itemWidth*0.01,),
                              Expanded(
                                child: Text("5:00 pm",
                                    style: montserratLight.copyWith(color:ColorResources.BLACK,
                                        fontSize: AppConstants.itemWidth*0.035)),
                              ),
                            ],
                          ),),
                          Expanded(child: Row(
                            children: [
                              Icon(Icons.date_range_outlined,color: ColorResources.BLACK.withOpacity(0.7),size: 18,),
                              SizedBox(width: AppConstants.itemWidth*0.01,),
                              Expanded(
                                child: Text("Feb 17",
                                    style: montserratLight.copyWith(color:ColorResources.BLACK,
                                        fontSize: AppConstants.itemWidth*0.035)),
                              ),
                            ],
                          ),)
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Container(
                            width: AppConstants.itemWidth,
                            margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02,horizontal: AppConstants.itemWidth*0.03),
                            padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.025),
                            decoration: BoxDecoration(
                              color: ColorResources.COLOR_PRIMERY,
                              borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.02),
                            ),
                            child: Text("Cancelled",textAlign: TextAlign.center,style: montserratMedium.copyWith(color: ColorResources.WHITE,fontSize: AppConstants.itemWidth*0.04)),
                          ),),
                          Expanded(child: Container(
                            width: AppConstants.itemWidth,
                            margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02,horizontal: AppConstants.itemWidth*0.03),
                            padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.025),
                            decoration: BoxDecoration(
                              color: ColorResources.COLOR_PRIMERY,
                              borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.02),
                            ),
                            child: Text("Reshedule",textAlign: TextAlign.center,style: montserratMedium.copyWith(color: ColorResources.WHITE,fontSize: AppConstants.itemWidth*0.04)),
                          ),),
                        ],
                      )
                    ],
                  )),
                  SizedBox(width: AppConstants.itemWidth*0.02,),
                ],
              ),
            ),
          );
        },),
    );
  }
}
