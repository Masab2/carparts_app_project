import 'package:carparts_app_project/Model/productModel.dart';
import 'package:carparts_app_project/utils/Color/appColor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavPageView extends StatefulWidget {
  final List<ProductModel> favItems;
  const FavPageView({super.key, required this.favItems});

  @override
  State<FavPageView> createState() => _FavPageViewState();
}

class _FavPageViewState extends State<FavPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: GoogleFonts.poppins(
            color: AppColor.redColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.favItems.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.geryColor.withOpacity(0.34),
            ),
            child: Row(
              children: [
                Image(image: AssetImage(widget.favItems[index].image)),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.favItems[index].title,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColor.redColor,
                          ),
                        ),
                        Text(
                          widget.favItems[index].description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
