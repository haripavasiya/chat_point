import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/doctor_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../notification/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorResources.WHITE,
    );
  }
}
