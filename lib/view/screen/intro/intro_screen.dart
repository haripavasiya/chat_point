import 'package:flutter/material.dart';
import '../../../model/onboarding_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';
import '../auth/sign_in.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final PageController _pageController = PageController();
  int selectedIndex=0;
  List<OnBoardingModel> onBoardingList=List.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData(){
    Future.delayed(Duration.zero).then((value) {
      setState(() {
        onBoardingList.add(OnBoardingModel(Images.onBoard_1,"Start Your Quick Chat","Lorem Ipsum is simply dummy text of theprinting and typesetting industry. Lorem Ipsumhas been the industry's standard dummy textever since the 1500s ."));
        onBoardingList.add(OnBoardingModel(Images.onBoard_2,"Stay Connect With Friends & Family","Lorem Ipsum is simply dummy text of theprinting and typesetting industry. Lorem Ipsumhas been the industry's standard dummy textever since the 1500s ."));
        onBoardingList.add(OnBoardingModel(Images.onBoard_3,"Let’s Doing Chat & Fun","Lorem Ipsum is simply dummy text of theprinting and typesetting industry. Lorem Ipsumhas been the industry's standard dummy textever since the 1500s ."));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppConstants.onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffD9F3F9),
          body: Container(
            decoration: const BoxDecoration(
                color: ColorResources.WHITE,
                image: DecorationImage(image: AssetImage(Images.splash_bg),fit: BoxFit.fill)
            ),
            child: Column(children: [
              SizedBox(height: AppConstants.itemHeight*0.05,),
              selectedIndex != 2?Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorResources.BLACK.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03),
                      ),
                      padding: EdgeInsets.symmetric(vertical:AppConstants.itemWidth*0.03,horizontal: AppConstants.itemWidth*0.08),
                      margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
                      child: Text("Skip",
                        style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.04, color: ColorResources.BLACK),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ],
              ):SizedBox(),
              Expanded(child: PageView.builder(
                itemCount: onBoardingList.length,
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(onBoardingList[index].imageUrl, width: AppConstants.itemWidth*0.9),
                          ],
                        ),
                        SizedBox(height: AppConstants.itemHeight*0.03,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                          child: Text(onBoardingList[index].title,
                            style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.06,color: ColorResources.BLACK),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: AppConstants.itemHeight*0.01,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                          child: Text(onBoardingList[index].description,
                            style: montserratLight.copyWith(fontSize: AppConstants.itemWidth*0.035, color: ColorResources.BLACK),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]);
                },
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex=index;
                  });
                },
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _pageIndicators(context),
                    ),
                  ),

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if(selectedIndex != 2||selectedIndex != 3) {
                            _pageController.animateToPage(selectedIndex-1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                          }else {

                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorResources.BLACK.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03),
                          ),
                          padding: EdgeInsets.symmetric(vertical:AppConstants.itemWidth*0.04,horizontal: AppConstants.itemWidth*0.04),
                          margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
                          child: Icon(Icons.arrow_back_ios_new,color: ColorResources.COLOR_PRIMERY,size: AppConstants.itemWidth*0.04,),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if(selectedIndex != 2) {
                            _pageController.animateToPage(selectedIndex+1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                          }else {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen(),));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorResources.BLACK.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03),
                          ),
                          padding: EdgeInsets.symmetric(vertical:AppConstants.itemWidth*0.04,horizontal: AppConstants.itemWidth*0.04),
                          margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
                          child: Icon(Icons.arrow_forward_ios_sharp,color: ColorResources.COLOR_PRIMERY,size: AppConstants.itemWidth*0.04,),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: AppConstants.itemHeight*0.05,),
            ]),
          ),
        ),
      ),
    );
  }

  List<Widget> _pageIndicators(BuildContext context) {
    List<Container> indicators = [];
    for (int i = 0; i < onBoardingList.length; i++) {
      indicators.add(
        Container(
          width: i == selectedIndex ?35.0:10.0,
          height: 10,
          margin: const EdgeInsets.only(right: 5,left: 5),
          decoration: BoxDecoration(
            color: i == selectedIndex ? ColorResources.COLOR_PRIMERY : ColorResources.WHITE.withOpacity(0.5),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      );
    }
    return indicators;
  }
}