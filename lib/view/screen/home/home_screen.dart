import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:chat_point/view/screen/doctor/doctor_screen.dart';
import 'package:chat_point/view/screen/services/services_screen.dart';

import '../../../model/doctor_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../doctor/doctor_details_screen.dart';
import '../notification/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.WHITE,
        body: Column(
          children: [
            SizedBox(height: AppConstants.itemWidth*0.02,),
            Row(
              children: [
                SizedBox(width: AppConstants.itemWidth*0.03,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Hi, Roni",style: montserratSamiBold.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.05),),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(Images.ic_hi,width: 25,height: 25,),
                          )
                        ],
                      ),
                      Text("How are you feeling today?",style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen(),)),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(Images.ic_notification,width: 25,height: 25,),
                  ),
                ),
                SizedBox(width: AppConstants.itemWidth*0.03,),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
                child: Column(
                  children: [
                    SizedBox(height: AppConstants.itemHeight*0.01,),
                    Image.asset(Images.img_home_slider, width: AppConstants.itemWidth),
                    SizedBox(height: AppConstants.itemHeight*0.01,),

                    // Search
                    Container(
                      decoration: BoxDecoration(
                          color: ColorResources.WHITE,
                          borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.1),
                          boxShadow: [
                            BoxShadow(
                                color: ColorResources.BLACK.withOpacity(0.1),
                                blurRadius: 1
                            )
                          ]
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02),
                      child: Row(
                        children: [
                          SizedBox(width: AppConstants.itemWidth*0.04,),
                          Expanded(
                            child: Text("Search...",
                                textAlign: TextAlign.start,
                                style: montserratRegular.copyWith(
                                  color: ColorResources.BLACK.withOpacity(0.5),
                                  fontSize: AppConstants.itemWidth*0.04,
                                )),
                          ),
                          SizedBox(width: AppConstants.itemWidth*0.03,),
                          Image.asset(Images.ic_search,width: 20,height: 20,),
                          SizedBox(width: AppConstants.itemWidth*0.03,),
                        ],
                      ),
                    ),

                    // Our Category
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text("Category",
                                style: montserratRegular.copyWith(
                                  color: ColorResources.BLACK,
                                  fontSize: AppConstants.itemWidth*0.045,
                                )),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicesListScreen(),)),
                            child: Text("See More",
                                style: montserratRegular.copyWith(
                                  color: ColorResources.COLOR_PRIMERY,
                                  fontSize: AppConstants.itemWidth*0.035,
                                )),
                          )
                        ]),
                    SizedBox(height: AppConstants.itemHeight*0.01,),

                    // Category List
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllDoctorScreen(),)),
                            child: ServiceView("Cardiologist", const Color(0xFFFFAE99), const Color(0xFFFF7854), Images.ic_cardiologist),
                          ),
                        ),
                        SizedBox(width: AppConstants.itemWidth*0.02,),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllDoctorScreen(),)),
                            child: ServiceView("Orthopedic", const Color(0xFF68EEBE), const Color(0xFF30D99C), Images.ic_orthopedic),
                          ),
                        ),
                        SizedBox(width: AppConstants.itemWidth*0.02,),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllDoctorScreen(),)),
                            child: ServiceView("Dentist", const Color(0xFFFDD497), const Color(0xFFFDA725), Images.ic_dentist),
                          ),
                        ),
                        SizedBox(width: AppConstants.itemWidth*0.02,),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllDoctorScreen(),)),
                            child: ServiceView("Ophthalmology", const Color(0xFF948BFF), const Color(0xFF4133E8), Images.ic_ophthalmology),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstants.itemHeight*0.01,),

                    // Our Services
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text("Tops Doctor’s For You",
                                style: montserratRegular.copyWith(
                                  color: ColorResources.BLACK,
                                  fontSize: AppConstants.itemWidth*0.045,
                                )),
                          ),
                          GestureDetector(
                            onTap:() => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const AllDoctorScreen())),
                            child: Text("See More",
                                style: montserratRegular.copyWith(
                                  color: ColorResources.COLOR_PRIMERY,
                                  fontSize: AppConstants.itemWidth*0.035,
                                )),
                          )
                        ]),
                    SizedBox(height: AppConstants.itemHeight*0.01,),
                    ListView.builder(
                      itemCount: doctorList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetailsScreen(doctorList[index]),)),
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
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.timer_outlined,color: ColorResources.BLACK.withOpacity(0.7),size: 18,),
                                        SizedBox(width: AppConstants.itemWidth*0.01,),
                                        Expanded(
                                          child: Text("${doctorList[index].time}",
                                              style: montserratLight.copyWith(color:ColorResources.BLACK,
                                                  fontSize: AppConstants.itemWidth*0.035)),
                                        ),
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
                                        Icon(Icons.star,color: ColorResources.YELLOW.withOpacity(0.7),size:20,),
                                        Text("${doctorList[index].rate}",
                                            style: montserratRegular.copyWith(color:Color(0xff6D6D6D),
                                                fontSize: AppConstants.itemWidth*0.035)),
                                      ],
                                    )
                                  ],
                                )),
                                SizedBox(width: AppConstants.itemWidth*0.02,),
                              ],
                            ),
                          ),
                        );
                      },)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceView extends StatelessWidget {
  String title,img;
  Color startColor,endColor;
  ServiceView(this.title,this.startColor,this.endColor,this.img,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                startColor,
                endColor,
              ],
            ),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Image.asset(img,width: 50,height: 50),
        ),
        Text(title,
            style: montserratRegular.copyWith(
              color: ColorResources.BLACK,
              fontSize: AppConstants.itemWidth*0.03,
            )),
      ],
    );
  }
}
