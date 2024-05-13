import 'package:carparts_app_project/utils/Asset/imageAsset.dart';
import 'package:carparts_app_project/utils/Color/appColor.dart';
import 'package:carparts_app_project/viewModel/SplashServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashServices splashServices = SplashServices();
  @override
  void initState() {
    splashServices.isLogin(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(ImageAsset.applogo),
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Auto Store',
            style:
                GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child:SpinKitChasingDots(
              color: AppColor.redColor,
              size: 40,
            )
          )
        ],
      ),
    );
  }
}
