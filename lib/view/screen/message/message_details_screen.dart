import 'package:chat_point/model/message_model.dart';
import 'package:flutter/material.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class MessageDetailsScreen extends StatefulWidget {
  MessageModel messageUserList;

  MessageDetailsScreen(this.messageUserList, {Key? key}) : super(key: key);

  @override
  State<MessageDetailsScreen> createState() => _MessageDetailsScreenState();
}

class _MessageDetailsScreenState extends State<MessageDetailsScreen> {
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
                  Container(
                    decoration: BoxDecoration(
                        color: ColorResources.WHITE,
                        borderRadius: BorderRadius.circular(
                            AppConstants.itemWidth * 0.02)),
                    padding: const EdgeInsets.all(7),
                    child:
                        const Icon(Icons.call, color: ColorResources.COLOR_PRIMERY),
                  ),
                  Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
