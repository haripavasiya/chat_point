import 'package:flutter/material.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';
import '../doctor/doctor_screen.dart';

class ServicesListScreen extends StatefulWidget {
  const ServicesListScreen({Key? key}) : super(key: key);

  @override
  State<ServicesListScreen> createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: TitleView('Category'), preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllDoctorScreen(),)),
                  child: ServiceView("Cardiologist", const Color(0xFFFFAE99), const Color(0xFFFF7854), Images.ic_cardiologist),
                ),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllDoctorScreen(),)),
                  child: ServiceView("Orthopedic", const Color(0xFF68EEBE), const Color(0xFF30D99C), Images.ic_orthopedic),
                ),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllDoctorScreen(),)),
                  child: ServiceView("Dentist", const Color(0xFFFDD497), const Color(0xFFFDA725), Images.ic_dentist),
                ),
              ),
            ],
          ),
          SizedBox(height: AppConstants.itemWidth*0.03,),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllDoctorScreen(),)),
                  child: ServiceView("Neurologist", const Color(0xFF6AC368), const Color(0xFF038E00), Images.ic_neurologist),
                ),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllDoctorScreen(),)),
                  child: ServiceView("Radiologist", const Color(0xFF68D6EE), const Color(0xFF21B9DA), Images.ic_radiologist),
                ),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllDoctorScreen(),)),
                  child: ServiceView("Surgeon", const Color(0xFFFE7E7E), const Color(0xFFFD1B1B), Images.ic_surgeon),
                ),
              ),
            ],
          ),
          SizedBox(height: AppConstants.itemWidth*0.03,),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllDoctorScreen(),)),
                  child: ServiceView("Ophthalmology", const Color(0xFF948BFF), const Color(0xFF4133E8), Images.ic_ophthalmology),
                ),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllDoctorScreen(),)),
                  child: ServiceView("Pathology", const Color(0xFFFF8BF3), const Color(0xFFE237D1), Images.ic_pathology),
                ),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ],
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
          padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.07),
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