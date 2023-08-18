import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_point/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<MessageModel> messageUserList=[];
  List<MessageModel> tempMessageUserList=[];
  TextEditingController nameController = TextEditingController();
  final FocusNode nameFocus = FocusNode();

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
    messageUserList.add(MessageModel(Images.ic_user_8, const Color(0xffFD9FCF), "Warren S. Yingling", "Voice Recording", "0", "0"));
    messageUserList.add(MessageModel(Images.ic_user_1, const Color(0xffFD9FCF), "Waran S. Yingling", "Last seen 10 min ago", "1", "0"));
    messageUserList.add(MessageModel(Images.ic_user_2, const Color(0xff56BADC), "Pol A. Brouillard", "Last seen 30 min ago", "1", "3"));
    tempMessageUserList.addAll(messageUserList);
  }

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
                  SizedBox(width: AppConstants.itemWidth*0.05,),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.arrow_back,size: 25,color: ColorResources.BLACK,),
                    ),
                  ),

                  Expanded(
                    child: Text("Search",
                      textAlign: TextAlign.center,
                      style: montserratSamiBold.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.05),),
                  ),
                  SizedBox(width: 25,),
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
                padding: EdgeInsets.only(top: AppConstants.itemWidth*0.05),
                margin: EdgeInsets.only(top:AppConstants.itemWidth*0.05),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical: AppConstants.itemWidth * 0.01,
                            horizontal: AppConstants.itemWidth * 0.03),
                        decoration: BoxDecoration(
                            color: ColorResources.WHITE.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: ColorResources.BLACK.withOpacity(0.3)),
                            boxShadow: [
                              BoxShadow(
                                  color: ColorResources.WHITE.withOpacity(0.1),
                                  blurRadius: 1),
                            ]),
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            SizedBox(
                              width: AppConstants.itemWidth * 0.03,
                            ),
                            Expanded(
                                child: TextFormField(
                                  controller: nameController,
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  focusNode: nameFocus,
                                  keyboardType: TextInputType.text,
                                  initialValue: null,
                                  textInputAction: TextInputAction.next,
                                  style: montserratRegular.copyWith(
                                      color: ColorResources.BLACK,
                                      fontSize: AppConstants.itemWidth * 0.035),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.singleLineFormatter
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      List<MessageModel> results = [];
                                      if (value.isEmpty) {
                                        results = tempMessageUserList;
                                      } else {
                                        results = messageUserList.where((artist) => artist.name.toLowerCase().contains(value.toLowerCase())).toList();
                                      }
                                      messageUserList = results;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Search here...',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: AppConstants.itemHeight * 0.02,
                                        horizontal: 5),
                                    isDense: true,
                                    counterText: '',
                                    focusedBorder:
                                    const OutlineInputBorder(borderSide: BorderSide.none),
                                    hintStyle: montserratRegular.copyWith(
                                        color: Theme.of(context).hintColor,
                                        fontSize: AppConstants.itemWidth * 0.035),
                                    errorStyle: const TextStyle(height: 1.5),
                                    border: InputBorder.none,
                                  ),
                                )),
                            SizedBox(
                              width: AppConstants.itemWidth * 0.03,
                            ),
                          ],
                        )),
                    Expanded(child: ListView.builder(
                      itemCount: messageUserList.length,
                      padding: EdgeInsets.only(top: AppConstants.itemWidth*0.05,right: AppConstants.itemWidth*0.03,left: AppConstants.itemWidth*0.03),
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(children: [
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
                                    child: Icon(
                                      Icons.circle,
                                      color: ColorResources.GREEN,
                                      size: 14,
                                    ),
                                  )
                                      : SizedBox(),
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
                              messageUserList[index].messageCount=="0"?SizedBox():Container(
                                decoration: BoxDecoration(
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
                          Divider(thickness: 1,)
                        ],);
                      },),)
                  ],
                ),
              ))

            ],
          ),
        ),
      ),
    );
  }
}
