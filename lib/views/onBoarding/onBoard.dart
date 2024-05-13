import 'package:carparts_app_project/utils/Asset/imageAsset.dart';
import 'package:carparts_app_project/utils/Color/appColor.dart';
import 'package:carparts_app_project/views/Home/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage(
                  ImageAsset.background,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        Positioned(
          top: 80,
          left: 0,
          right: 0,
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Get the Thousands of Parts That Fits Best For you',
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: 15,
          right: 15,
          bottom: 15,
          child: MaterialButton(
            color: AppColor.redColor,
            minWidth: double.infinity,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            height: 50,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Exploring',
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
