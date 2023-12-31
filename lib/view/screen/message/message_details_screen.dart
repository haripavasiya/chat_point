import 'package:chat_point/model/message_model.dart';
import 'package:chat_point/view/screen/call/call_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../model/message_details_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/styles.dart';

class MessageDetailsScreen extends StatefulWidget {
  MessageModel messageUserList;

  MessageDetailsScreen(this.messageUserList, {Key? key}) : super(key: key);

  @override
  State<MessageDetailsScreen> createState() => _MessageDetailsScreenState();
}

class _MessageDetailsScreenState extends State<MessageDetailsScreen> {
  List<MessageDetailsModel> messageList=[];
  TextEditingController messageController = TextEditingController();
  final FocusNode messageFocus = FocusNode();
  ScrollController listScrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageList.add(MessageDetailsModel("1", "Hello", "9:42 AM"));
    messageList.add(MessageDetailsModel("1", "Hello Brother", "9:42 AM"));
    messageList.add(MessageDetailsModel("2", "Hello,", "9:43 AM"));
    messageList.add(MessageDetailsModel("2", "Hello Brother", "9:43 AM"));
    messageList.add(MessageDetailsModel("1", "How are you my dear Brother ?", "9:44 AM"));
    messageList.add(MessageDetailsModel("2", "I am fine  & you ?", "9:44 AM"));
    messageList.add(MessageDetailsModel("1", "I am also fine Bro", "9:45 AM"));
    messageList.add(MessageDetailsModel("1", "How is your day ?", "9:45 AM"));
    messageList.add(MessageDetailsModel("2", "I'm doing well", "9:46 AM"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffCED9F9),
                Color(0xffE7D9F3),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: AppConstants.itemWidth * 0.01,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: ColorResources.BLACK,
                      size: 18,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: widget.messageUserList.color,
                        borderRadius: BorderRadius.circular(
                            AppConstants.itemWidth * 0.02)),
                    child: Image.asset(
                      widget.messageUserList.imageUrl,
                      height: AppConstants.itemWidth * 0.11,
                      width: AppConstants.itemWidth * 0.11,
                    ),
                  ),
                  SizedBox(
                    width: AppConstants.itemWidth * 0.02,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(widget.messageUserList.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: montserratRegular.copyWith(
                                      color: ColorResources.BLACK,
                                      fontSize: AppConstants.itemWidth * 0.04)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppConstants.itemWidth * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(widget.messageUserList.status,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: montserratLight.copyWith(
                                      color:
                                          ColorResources.BLACK.withOpacity(0.3),
                                      fontSize:
                                          AppConstants.itemWidth * 0.035)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CallScreen(widget.messageUserList),)),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorResources.WHITE,
                          borderRadius: BorderRadius.circular(
                              AppConstants.itemWidth * 0.02)),
                      padding: const EdgeInsets.all(7),
                      child:
                          const Icon(Icons.call, color: ColorResources.COLOR_PRIMERY),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CallScreen(widget.messageUserList),)),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorResources.WHITE,
                          borderRadius: BorderRadius.circular(
                              AppConstants.itemWidth * 0.02)),
                      padding: const EdgeInsets.all(7),
                      margin: EdgeInsets.symmetric(
                          horizontal: AppConstants.itemWidth * 0.02),
                      child: const Icon(Icons.video_camera_back_outlined,
                          color: ColorResources.COLOR_PRIMERY),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorResources.WHITE,
                        borderRadius: BorderRadius.circular(
                            AppConstants.itemWidth * 0.02)),
                    padding: const EdgeInsets.all(7),
                    child: const Icon(Icons.more_horiz,
                        color: ColorResources.COLOR_PRIMERY),
                  ),
                  SizedBox(
                    width: AppConstants.itemWidth * 0.01,
                  ),
                ],
              ),
              Expanded(child: ListView.builder(
                itemCount: messageList.length,
                controller: listScrollController,
                padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return messageList[index].type=="1"
                      ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffEBF3FF),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                        ),
                        padding:const EdgeInsets.all(10),
                        child: Text(messageList[index].message,style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),),
                      ),
                      Text(messageList[index].time,style: montserratLight.copyWith(color: ColorResources.BLACK.withOpacity(0.5),fontSize: AppConstants.itemWidth*0.022),),
                      const SizedBox(height: 5,),
                    ],
                  )
                      :
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffD0E3FF),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                        ),
                        padding:const EdgeInsets.all(10),
                        child: Text(messageList[index].message,style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),),
                      ),
                      Text(messageList[index].time,style: montserratLight.copyWith(color: ColorResources.BLACK.withOpacity(0.5),fontSize: AppConstants.itemWidth*0.022),),
                      const SizedBox(height: 5,),
                    ],
                  );
              },)),
              Row(
                children: [
                  SizedBox(
                    width: AppConstants.itemWidth * 0.03,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: ColorResources.WHITE,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                  ColorResources.WHITE.withOpacity(0.1),
                                  blurRadius: 1),
                            ]),
                        child: TextFormField(
                          controller: messageController,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          focusNode: messageFocus,
                          keyboardType: TextInputType.text,
                          initialValue: null,
                          textInputAction: TextInputAction.next,
                          style: montserratRegular.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: AppConstants.itemWidth * 0.035),
                          inputFormatters: [
                            FilteringTextInputFormatter
                                .singleLineFormatter
                          ],
                          onChanged: (value) {
                            if(value[0]==' '){
                              messageController.text=='';
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Type...',
                            contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                            isDense: true,
                            counterText: '',
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintStyle: montserratRegular.copyWith(
                                color: ColorResources.COLOR_PRIMERY,
                                fontSize: AppConstants.itemWidth * 0.035),
                            errorStyle: const TextStyle(height: 1.5),
                            border: InputBorder.none,
                          ),
                        )),
                  ),
                  SizedBox(
                    width: AppConstants.itemWidth * 0.03,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if(messageController.text==''){
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please type some message'),
                                backgroundColor: ColorResources.RED,
                                duration: Duration(seconds: 2),
                              )
                          );
                        }else{
                          messageList.add(MessageDetailsModel("1", messageController.text, dateformatechamge()));
                          messageController.text='';
                          listScrollController.jumpTo(listScrollController.position.maxScrollExtent);
                        }
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: ColorResources.WHITE,
                          borderRadius: BorderRadius.circular(
                              AppConstants.itemWidth * 0.02)),
                      padding: const EdgeInsets.all(7),
                      child:
                      const Icon(Icons.send, color: ColorResources.COLOR_PRIMERY),
                    ),
                  ),
                  SizedBox(
                    width: AppConstants.itemWidth * 0.03,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  dateformatechamge(){
    DateTime today = DateTime.now();
    var outputDate = DateFormat('hh:mm a').format(today);
    return outputDate;
  }
}
