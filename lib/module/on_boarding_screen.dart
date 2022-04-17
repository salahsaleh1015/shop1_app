import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:shop1_app/module/login_screen.dart';
import 'package:shop1_app/shared/component/reusable.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        image: "images/images.jpg",
        title: "OnBoarding 1 title",
        body: "OnBoarding 1 body"),
    OnBoardingModel(
        image: "images/images.jpg",
        title: "OnBoarding 2 title",
        body: "OnBoarding 2 body"),
    OnBoardingModel(
        image: "images/images.jpg",
        title: "OnBoarding 3 title",
        body: "OnBoarding 3 body"),
  ];
  var onBoardingController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [buildTextButton(onTap: () {}, text: "skip")]),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: PageView.builder(
              controller: onBoardingController,
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                }
              },
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, i) => buildOnBoarding(boarding[i]),
              itemCount: boarding.length,
            )),
            SizedBox(
              height: 150,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: onBoardingController,
                  effect: SlideEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 4,
                  ),
                  count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(isLast == true){
                      navigateAndFinish(context , LoginScreen());
                    }else{
                      onBoardingController.nextPage(
                          duration: Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.easeIn);
                    }

                  },
                  mini: true,
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildOnBoarding(OnBoardingModel boarding) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${boarding.image}'),
            ),
          ),
          Text("${boarding.title}"),
          SizedBox(
            height: 20,
          ),
          Text("${boarding.body}"),
        ],
      );
}
