import 'package:flutter/material.dart';

import '../../../model/message_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MessageModel> messageUserList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageUserList.add(MessageModel(Images.ic_user_1, const Color(0xffFD9FCF), "Warren S. Yingling", "Online", "1", "0"));
    messageUserList.add(MessageModel(Images.ic_user_2, const Color(0xff56BADC), "Paul A. Brouillard", "Online", "1", "0"));
    messageUserList.add(MessageModel(Images.ic_user_3, const Color(0xff577CFF), "Misti L. Robinson", "Online", "0", "0"));
    messageUserList.add(MessageModel(Images.ic_user_4, const Color(0xffFE649C), "Jessie J. Jasmin", "Photos", "0", "3"));
    messageUserList.add(MessageModel(Images.ic_user_5, const Color(0xff577CFF), "Vicente J. Duguay", "Photos & Videos", "0", "5"));
    messageUserList.add(MessageModel(Images.ic_user_6, const Color(0xffFE649C), "Georgia T. Sandoval", "Last seen 12 min ago", "0", "0"));
    messageUserList.add(MessageModel(Images.ic_user_7, const Color(0xff56BADC), "Lauren J. Scott", "Last seen 20 min ago", "0", "0"));
    messageUserList.add(MessageModel(Images.ic_user_8, const Color(0xffFD9FCF), "Warren S. Yingling", "Voice Recording", "0", "0"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      decoration: BoxDecoration(
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
                child: Text("Message",
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
          Expanded(child: Container(
            width: AppConstants.itemWidth,
            decoration: BoxDecoration(
                color: ColorResources.WHITE,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConstants.itemWidth*0.1),topRight: Radius.circular(AppConstants.itemWidth*0.1))
            ),
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
          ))
        ],
      ),
    ));
  }
}
