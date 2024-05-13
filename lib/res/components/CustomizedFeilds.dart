// ignore_for_file: must_be_immutable

import 'package:carparts_app_project/utils/Color/appColor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizedFeild extends StatelessWidget {
  String? title;
  String? hint;
  Widget? sufixIcon;
  Widget? prefixIcon;
  bool? obscuretext = false;
  TextEditingController controller;
  int maxlines;
  CustomizedFeild(
      {super.key,
      this.title,
      required this.controller,
      this.hint,
      this.sufixIcon,
      this.prefixIcon,
      this.maxlines = 1,
      this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title ?? "",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.geryColor.withOpacity(0.34)),
          child: TextFormField(
            controller: controller,
            obscureText: obscuretext ?? false,
            maxLines: maxlines,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                prefixIcon: prefixIcon,
                suffixIcon: sufixIcon),
          ),
        ),
      ],
    );
  }
}
