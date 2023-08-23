import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/button/custom_button.dart';
import '../notification/notification_screen.dart';
import '../search/search_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController nameControll=TextEditingController();
  TextEditingController phoneControll=TextEditingController();
  TextEditingController infoControll=TextEditingController();
  File imageFile = File("");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameControll.text="Misti L. Robinson";
    phoneControll.text="+91 1234567890";
    infoControll.text="Lorem Ipsum";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.TRANSPARENT,
      body: SafeArea(
        child: Container(
          color: ColorResources.TRANSPARENT,
          child: Column(
            children: [
              SizedBox(height: AppConstants.itemWidth*0.02,),
              Row(
                children: [
                  SizedBox(width: AppConstants.itemWidth*0.03,),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),)),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(Images.ic_search,width: 25,height: 25,),
                    ),
                  ),

                  Expanded(
                    child: Text("Profile",
                      textAlign: TextAlign.center,
                      style: montserratSamiBold.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.05),),
                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen(),)),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(Images.ic_notification,width: 25,height: 25,color: ColorResources.BLACK),
                    ),
                  ),
                  SizedBox(width: AppConstants.itemWidth*0.03,),
                ],
              ),
              Expanded(child: Container(
                width: AppConstants.itemWidth,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffFFFFFF).withOpacity(0.2),
                        Color(0xffFFDFFC),
                      ],
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConstants.itemWidth*0.1),topRight: Radius.circular(AppConstants.itemWidth*0.1))
                ),
                padding: EdgeInsets.only(bottom: 110),
                margin: EdgeInsets.only(top:AppConstants.itemWidth*0.1),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(right: AppConstants.itemWidth*0.03,left: AppConstants.itemWidth*0.03),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: AppConstants.itemWidth*0.07,),
                    imageFile.path==""?ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        height: AppConstants.itemHeight*0.15,
                        imageUrl:"https://cdn-icons-png.flaticon.com/512/3177/3177440.png",
                        errorWidget: (context, url, error) => Image.asset(Images.placeholderImages,height: AppConstants.itemHeight*0.1,width: AppConstants.itemHeight*0.15,),
                        progressIndicatorBuilder: (context, url, downloadProgress) => const Center(child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),),
                        fit: BoxFit.cover,
                        width: AppConstants.itemHeight*0.15,
                      ),
                    )
                        :
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.file(imageFile,
                        fit: BoxFit.cover,
                        width: AppConstants.itemHeight*0.15,
                        height: AppConstants.itemHeight*0.15,),
                    ),
                    SizedBox(height: AppConstants.itemWidth*0.02,),
                    GestureDetector(
                      onTap: () => getImagePick(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Images.ic_camera,height: 25,width: 25,color: ColorResources.COLOR_PRIMERY,),
                          SizedBox(width: AppConstants.itemWidth*0.02,),
                          Text("Change",
                            style: montserratRegular.copyWith(color: ColorResources.COLOR_PRIMERY,fontSize: AppConstants.itemWidth*0.05),)
                        ],
                      ),
                    ),
                    SizedBox(height: AppConstants.itemWidth*0.07,),
                    Row(
                      children: [
                        Image.asset(Images.ic_user,width: 25,height: 25,color: ColorResources.BLACK,),
                        Expanded(
                          child: TextFormField(
                            controller:nameControll,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            style: montserratRegular.copyWith(color: ColorResources.BLACK),
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter
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
                    const Divider(thickness: 1),
                    SizedBox(height: AppConstants.itemWidth*0.03,),

                    Row(
                      children: [
                        Image.asset(Images.ic_info,width: 25,height: 25,color: ColorResources.BLACK,),
                        Expanded(
                          child: TextFormField(
                            controller:infoControll,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            style: montserratRegular.copyWith(color: ColorResources.BLACK),
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter
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
                    const Divider(thickness: 1),
                    SizedBox(height: AppConstants.itemWidth*0.03,),

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
                    const Divider(thickness: 1),
                    SizedBox(height: AppConstants.itemWidth*0.03,),

                    GestureDetector(
                      onTap:() {
                      },
                      child: const CustomButton("Update"),
                    ),
                  ],
                ),),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Future getImagePick() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
