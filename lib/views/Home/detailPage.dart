import 'package:carparts_app_project/Model/productModel.dart';
import 'package:carparts_app_project/utils/Color/appColor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPageView extends StatefulWidget {
  final ProductModel model;
  const DetailPageView({super.key, required this.model});

  @override
  State<DetailPageView> createState() => _DetailPageViewState();
}

class _DetailPageViewState extends State<DetailPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: AssetImage(widget.model.image),
                ),
                Positioned(
                  top: 0,
                  left: 10,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.23),
                      ),
                      child: const Center(
                          child:
                              Icon(Icons.arrow_back_ios, color: Colors.black)),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.model.title,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "\$${widget.model.price}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: AppColor.redColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    children: [
                      Text(
                        widget.model.description,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: AppColor.geryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
