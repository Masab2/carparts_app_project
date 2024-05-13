import 'package:carparts_app_project/Model/productModel.dart';
import 'package:carparts_app_project/utils/Asset/imageAsset.dart';
import 'package:carparts_app_project/utils/Color/appColor.dart';
import 'package:carparts_app_project/views/Home/cartView.dart';
import 'package:carparts_app_project/views/Home/detailPage.dart';
import 'package:carparts_app_project/views/Home/favPageView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static List<ProductModel> cartItems = [];
  static List<ProductModel> favItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            ImageAsset.catgoriesicon,
            height: 20,
            width: 20,
            color: AppColor.redColor,
          ),
        ),
        title: RichText(
          text: TextSpan(
            text: 'CAR',
            style: GoogleFonts.poppins(
              fontSize: 23,
              color: AppColor.redColor,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Parts',
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  color: AppColor.geryColor,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavPageView(favItems: favItems),
                ),
              );
            },
            icon: const Icon(
              Icons.favorite_outline,
              color: AppColor.redColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: ProductModel.model.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                var data = ProductModel.model[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPageView(model: data),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                height: 120,
                                width: 120,
                                data.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    data.isFav = !data.isFav;
                                    if (data.isFav) {
                                      favItems.add(data);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: AppColor.redColor,
                                          content: Text(
                                              '${data.title} added to Favourite.'),
                                        ),
                                      );
                                    } else {
                                      favItems.remove(data);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: AppColor.redColor,
                                          content: Text(
                                              '${data.title} remove from Favourite.'),
                                        ),
                                      );
                                    }
                                  });
                                },
                                icon: data.isFav
                                    ? const Icon(
                                        Icons.favorite,
                                        color: AppColor.redColor,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline,
                                        color: AppColor.geryColor,
                                      ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.title,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "\$${data.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.redColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  cartItems.add(data);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppColor.redColor,
                                    content:
                                        Text('${data.title} added to cart.'),
                                  ),
                                );
                              },
                              minWidth: 120,
                              height: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: AppColor.redColor,
                              child: Text(
                                'Add To Cart',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartView(
                carItems: cartItems,
              ),
            ),
          );
        },
        backgroundColor: AppColor.redColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
