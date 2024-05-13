import 'package:carparts_app_project/res/components/CustomizedFeilds.dart';
import 'package:carparts_app_project/utils/Asset/imageAsset.dart';
import 'package:carparts_app_project/utils/Color/appColor.dart';
import 'package:carparts_app_project/views/onBoarding/onBoard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final ValueNotifier<bool> _obscurepass = ValueNotifier(true);
  @override
  void dispose() {
    //implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    _obscurepass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(ImageAsset.applogo),
                width: 200,
                height: 200,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Let's Sign you up",
            style: GoogleFonts.roboto(
                color: AppColor.redColor,
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Revolutionizing Your Ride, One Part at a Time",
            style: GoogleFonts.roboto(
                color: AppColor.redColor.withOpacity(0.44),
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomizedFeild(
                  title: 'Email',
                  hint: 'abc@gmail.com',
                  prefixIcon: const Icon(Icons.email),
                  controller: emailcontroller,
                ),
                const SizedBox(
                  height: 10,
                ),
                ValueListenableBuilder(
                  valueListenable: _obscurepass,
                  builder: (context, value, child) {
                    return CustomizedFeild(
                      title: 'Password',
                      hint: '6 character/digit',
                      prefixIcon: const Icon(Icons.lock),
                      obscuretext: _obscurepass.value,
                      sufixIcon: InkWell(
                          onTap: () {
                            _obscurepass.value = !_obscurepass.value;
                          },
                          child: _obscurepass.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      controller: passwordcontroller,
                    );
                  },
                ),
                const SizedBox(height: 50),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  height: 50,
                  minWidth: double.infinity,
                  color: AppColor.redColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnBoardView(),
                        ));
                  },
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account",
                      style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: AppColor.geryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Login",
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: AppColor.redColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
