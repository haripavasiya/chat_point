import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../appointment/my_appointment_screen.dart';
import '../chat/chat_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int pageIndex=0;
  List<Widget> screenList=[];

  @override
  void initState() {
    super.initState();
    pageIndex=0;
    screenList=[
      const HomeScreen(),
      const MyAppointmentScreen(),
      const ChatScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      body: screenList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorResources.COLOR_PRIMERY.withOpacity(0.20),
        selectedItemColor: ColorResources.COLOR_PRIMERY,
        unselectedItemColor: ColorResources.COLOR_PRIMERY,
        showUnselectedLabels: false,
        currentIndex: pageIndex,
        elevation: 0,
        selectedLabelStyle: montserratMedium.copyWith(color:ColorResources.BLACK,),
        unselectedLabelStyle: montserratRegular.copyWith(color:ColorResources.BLACK.withOpacity(0.5),),
        type: BottomNavigationBarType.fixed,
        items: [
          barItem(Images.ic_home, 0),
          barItem(Images.ic_date, 1),
          barItem(Images.ic_chat, 2),
          barItem(Images.ic_user, 3),
        ],
        onTap: (value) {
          setState(() {
            pageIndex=value;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem barItem(String icon, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          icon, color: ColorResources.BLACK,
          height: 25, width: 25,
        ),
      ),
      label: "."
    );
  }
}