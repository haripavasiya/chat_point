import 'package:flutter/material.dart';

import '../../utill/app_constants.dart';
import '../../utill/color_resources.dart';
import '../../utill/styles.dart';

class TitleView extends StatelessWidget {
  String title;
  TitleView(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorResources.WHITE,
      automaticallyImplyLeading: false,
      elevation: 1,
      centerTitle: true,
      actionsIconTheme: IconThemeData(color: ColorResources.WHITE),
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: const Icon(Icons.arrow_back,color: ColorResources.BLACK,size: 24,)),
      ),
      title: Text(title,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: montserratMedium.copyWith(
              color: ColorResources.BLACK,
              fontSize: AppConstants.itemWidth*0.04)),
    );
  }
}
