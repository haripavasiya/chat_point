import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chat_point/model/doctor_model.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class ChatDetailsScreen extends StatefulWidget {
  DoctorModel doctorList;
  ChatDetailsScreen(this.doctorList, {Key? key}) : super(key: key);

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {

  TextEditingController messageControll=TextEditingController();
  final FocusNode messageFocus = FocusNode();

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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,color: ColorResources.BLACK,size: 24,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppConstants.itemHeight*0.18),
                        child: CachedNetworkImage(
                          height: AppConstants.itemHeight*0.05,
                          imageUrl:widget.doctorList.imageUrl,
                          errorWidget: (context, url, error) => Image.asset(Images.placeholderImages,height: AppConstants.itemHeight*0.1,width: AppConstants.itemHeight*0.15,),
                          progressIndicatorBuilder: (context, url, downloadProgress) => const Center(child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),),
                          fit: BoxFit.cover,
                          width: AppConstants.itemHeight*0.05,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: AppConstants.itemWidth*0.02,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.doctorList.name,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: montserratMedium.copyWith(
                            color: ColorResources.BLACK,
                            fontSize: AppConstants.itemWidth*0.04)),
                    Text("Active Now",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: montserratMedium.copyWith(
                            color: ColorResources.GREY,
                            fontSize: AppConstants.itemWidth*0.03))
                  ],
                )),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(Images.ic_call,width: 25,height: 25,color: ColorResources.BLACK,),
                  ),
                ),
                SizedBox(width: AppConstants.itemWidth*0.03,),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(Images.ic_video,width: 25,height: 25,color: ColorResources.BLACK,),
                  ),
                ),
                SizedBox(width: AppConstants.itemWidth*0.03,),
              ],
            ),
            const Divider(thickness: 1,),
            Expanded(child: Column(
              children: [
                // List Message
                const Expanded(child: SizedBox()),

                // Send message
                Container(
                    margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.02),
                    padding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.01),
                    decoration: BoxDecoration(
                      color: const Color(0xffEFEFEF),
                      borderRadius:BorderRadius.circular(AppConstants.itemWidth*0.1),
                    ),
                    child:Row(
                      children: [
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Expanded(child: TextFormField(
                          controller: messageControll,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          focusNode: messageFocus,
                          keyboardType: TextInputType.text,
                          initialValue: null,
                          textInputAction: TextInputAction.next,
                          style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                          decoration: InputDecoration(
                            hintText: 'Send Message',
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              messageControll.text="";
                            });
                          },
                            child: Image.asset(Images.ic_send,width: 25,height: 25,color: ColorResources.BLACK,)),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                      ],
                    )
                ),
                SizedBox(height: AppConstants.itemHeight*0.01,),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
