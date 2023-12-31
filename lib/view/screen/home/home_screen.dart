import 'package:chat_point/view/screen/message/message_details_screen.dart';
import 'package:chat_point/view/screen/notification/notification_screen.dart';
import 'package:chat_point/view/screen/search/search_screen.dart';
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
    messageUserList.add(MessageModel(Images.ic_user_3, const Color(0xff577CFF), "Misti L. Robinson", "Online", "1", "0"));
    messageUserList.add(MessageModel(Images.ic_user_4, const Color(0xffFE649C), "Jessie J. Jasmin", "Photos", "0", "3"));
    messageUserList.add(MessageModel(Images.ic_user_5, const Color(0xff577CFF), "Vicente J. Duguay", "Photos & Videos", "0", "5"));
    messageUserList.add(MessageModel(Images.ic_user_6, const Color(0xffFE649C), "Georgia T. Sandoval", "Last seen 12 min ago", "0", "0"));
    messageUserList.add(MessageModel(Images.ic_user_7, const Color(0xff56BADC), "Lauren J. Scott", "Last seen 20 min ago", "0", "0"));
    messageUserList.add(MessageModel(Images.ic_user_8, const Color(0xffFD9FCF), "Warren S. Yingling", "Voice Recording", "0", "3"));
    messageUserList.add(MessageModel(Images.ic_user_1, const Color(0xffFD9FCF), "Waran S. Yingling", "Last seen 10 min ago", "1", "0"));
    messageUserList.add(MessageModel(Images.ic_user_2, const Color(0xff56BADC), "Pol A. Brouillard", "Last seen 30 min ago", "1", "3"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.TRANSPARENT,
      body: SafeArea(child: Container(
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
                  child: Text("Message",
                    textAlign: TextAlign.center,
                    style: montserratSamiBold.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.05),),
                ),

                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen(),)),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(Images.ic_notification,width: 25,height: 25,color: ColorResources.BLACK,),
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
                      const Color(0xffFFFFFF).withOpacity(0.2),
                      const Color(0xffFFDFFC),
                    ],
                  ),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConstants.itemWidth*0.1),topRight: Radius.circular(AppConstants.itemWidth*0.1))
              ),
              padding: EdgeInsets.only(bottom: 110,top: AppConstants.itemWidth*0.05),
              margin: EdgeInsets.only(top:AppConstants.itemWidth*0.1),
              child: ListView.builder(
                itemCount: messageUserList.length,
                padding: EdgeInsets.only(top: AppConstants.itemWidth*0.07,right: AppConstants.itemWidth*0.05,left: AppConstants.itemWidth*0.05),
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MessageDetailsScreen(messageUserList[index]),)),
                  child: Column(children: [
                    Row(
                      children: [
                        Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: messageUserList[index].color,
                                      borderRadius: BorderRadius.circular(
                                          AppConstants.itemWidth * 0.02)),
                                  child: Image.asset(
                                    messageUserList[index].imageUrl,
                                    height: AppConstants.itemWidth * 0.15,
                                    width: AppConstants.itemWidth * 0.15,
                                  ),
                                ),
                                messageUserList[index].isOnline == "1"
                                    ? Container(
                                        decoration: BoxDecoration(
                                            color: ColorResources.WHITE
                                                .withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(
                                                AppConstants.itemWidth * 0.02)),
                                        padding: EdgeInsets.all(
                                            AppConstants.itemWidth * 0.005),
                                        child: const Icon(
                                          Icons.circle,
                                          color: ColorResources.GREEN,
                                          size: 14,
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                        SizedBox(width: AppConstants.itemWidth*0.04,),
                        Expanded(child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text("${messageUserList[index].name}",
                                      style: montserratMedium.copyWith(color:ColorResources.BLACK,
                                          fontSize: AppConstants.itemWidth*0.045)),
                                ),
                              ],
                            ),
                            SizedBox(height: AppConstants.itemWidth*0.01,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text("${messageUserList[index].status}",
                                      style: montserratMedium.copyWith(color:ColorResources.BLACK.withOpacity(0.5),
                                          fontSize: AppConstants.itemWidth*0.035)),
                                ),
                              ],
                            ),
                          ],
                        )),
                        messageUserList[index].messageCount=="0"?const SizedBox():Container(
                          decoration: const BoxDecoration(
                              color: Color(0xff1E1E1E),
                            shape: BoxShape.circle
                          ),
                          padding:EdgeInsets.all(AppConstants.itemWidth*0.018),
                          child: Text("${messageUserList[index].messageCount}",
                              style: montserratMedium.copyWith(color:ColorResources.WHITE,
                                  fontSize: AppConstants.itemWidth*0.03)),
                        ),
                        SizedBox(width: AppConstants.itemWidth*0.02,),
                      ],
                    ),
                    const Divider(thickness: 1,)
                  ],),
                );
              },),
            )),
          ],
        ),
      )),
    );
  }
}
