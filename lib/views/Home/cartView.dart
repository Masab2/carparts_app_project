import 'package:carparts_app_project/Model/productModel.dart';
import 'package:carparts_app_project/utils/Color/appColor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slideable/slideable.dart';

class CartView extends StatefulWidget {
  final List<ProductModel> carItems;
  const CartView({super.key, required this.carItems});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: GoogleFonts.poppins(
            color: AppColor.redColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: widget.carItems.length,
            itemBuilder: (context, index) {
              return Slideable(
                resetSlide: true,
                items: <ActionItems>[
                  ActionItems(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPress: () {
                      setState(() {
                        widget.carItems.removeAt(index);
                      });
                    },
                    backgroudColor: Colors.transparent,
                  ),
                ],
                child: Container(
                  height: 150,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColor.geryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: Image(
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                          image: AssetImage(widget.carItems[index].image),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.carItems[index].title,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.carItems[index].description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.43),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${widget.carItems[index].price}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.redColor,
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: AppColor.redColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  widget.carItems[index]
                                                      .quntity++;
                                                });
                                              },
                                              child: const Icon(Icons.add,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              widget.carItems[index].quntity
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            GestureDetector(
                                              onTap: () {
                                                if (widget.carItems[index]
                                                        .quntity ==
                                                    0) {
                                                  setState(() {
                                                    widget.carItems[index]
                                                            .quntity ==
                                                        0;
                                                  });
                                                } else {
                                                  setState(() {
                                                    widget.carItems[index]
                                                        .quntity--;
                                                  });
                                                }
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
