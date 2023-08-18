import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController usernameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController phonenoController =TextEditingController();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phonenoFocus = FocusNode();
  File imageFile = File("");
  ImageCropper imagecropp = new ImageCropper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(

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
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(Images.ic_notification,width: 25,height: 25,),
                  ),
                ),
                SizedBox(width: AppConstants.itemWidth*0.03,),
              ],
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.file(imageFile,
                    fit: BoxFit.cover,
                    width: AppConstants.itemHeight*0.15,
                    height: AppConstants.itemHeight*0.15,),
                ),
                GestureDetector(
                  onTap: () => getImagePick(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Images.ic_camera,height: 25,width: 25,color: ColorResources.COLOR_PRIMERY,),
                      Text("Change",
                        style: montserratSamiBold.copyWith(color: ColorResources.COLOR_PRIMERY,fontSize: AppConstants.itemWidth*0.05),)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future getImagePick() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    File? file = File(imageFile.path);
    if (pickedFile != null) {
      CroppedFile? cropped = (await imagecropp.cropImage(
          sourcePath: pickedFile.path,
          compressQuality: 40,
          compressFormat: ImageCompressFormat.jpg,
          aspectRatioPresets: [
            CropAspectRatioPreset.original
          ],
          uiSettings: [
            IOSUiSettings(minimumAspectRatio: 1.0,),
            AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: ColorResources.GREY,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.square,
                lockAspectRatio: false),
          ])); /*as File?;*/
      setState(() {
        if (cropped != null) {
          print(File(cropped.path));
          imageFile=File(cropped.path);
        }
      });
    }
    return file;
  }
}
