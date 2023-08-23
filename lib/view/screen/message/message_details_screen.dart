import 'package:chat_point/model/message_model.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xffB8D3FC),
                Color(0xffFFDFFC),
              ],
            ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: AppConstants.itemWidth * 0.02,
                ),
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new,color: ColorResources.BLACK,size: 18,)),
                Container(
                  decoration: BoxDecoration(
                      color: widget.messageUserList.color,
                      borderRadius:
                      BorderRadius.circular(
                          AppConstants.itemWidth *
                              0.02)),
                  child: Image.asset(
                    widget.messageUserList.imageUrl,
                    height:
                    AppConstants.itemWidth * 0.15,
                    width:
                    AppConstants.itemWidth * 0.15,
                  ),
                ),
                SizedBox(
                  width: AppConstants.itemWidth * 0.04,
                ),
                Expanded(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                  widget.messageUserList.name,
                                  style: montserratMedium
                                      .copyWith(
                                      color:
                                      ColorResources
                                          .BLACK,
                                      fontSize: AppConstants
                                          .itemWidth *
                                          0.045)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                          AppConstants.itemWidth * 0.01,
                        ),
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                  widget.messageUserList.status,
                                  style: montserratMedium
                                      .copyWith(
                                      color: ColorResources
                                          .BLACK
                                          .withOpacity(
                                          0.5),
                                      fontSize: AppConstants
                                          .itemWidth *
                                          0.035)),
                            ),
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  width: AppConstants.itemWidth * 0.02,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
