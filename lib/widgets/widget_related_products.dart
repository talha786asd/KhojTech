import 'package:flutter/material.dart';
import 'package:khoj_tech/api_service.dart';
import 'package:khoj_tech/models/product.dart';
import 'package:shimmer/shimmer.dart';
import 'package:khoj_tech/widgets/text_widget.dart';


class WidgetRelatedProducts extends StatefulWidget {
  WidgetRelatedProducts({Key? key, this.labelName, this.products})
      : super(key: key);

  String? labelName;
  List<int>? products;

  @override
  State<WidgetRelatedProducts> createState() => _WidgetRelatedProductsState();
}

class _WidgetRelatedProductsState extends State<WidgetRelatedProducts> {
  APIService? apiService;

  @override
  void initState() {
    apiService = APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .9,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              TextWidget(
                text: widget.labelName,
                color: Color(
                  0xff414042,
                ),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              Spacer(),
              TextWidget(
                text: 'View more ..',
                color: Color(
                  0xff292665,
                ),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .024,
        ),
        _productList(),
        SizedBox(
          height: MediaQuery.of(context).size.height * .024,
        ),
      ],
    );
  }

  Widget _productList() {
    return FutureBuilder(
        future: apiService!.getProducts(productsIds: widget.products),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> model) {
          if (model.hasData) {
            return _buildList(model.data!);
          }
          return Container(
            width: MediaQuery.of(context).size.width * .93,
            height: MediaQuery.of(context).size.height * .27,
            child: Shimmer.fromColors(
              baseColor: Colors.black12,
              highlightColor: Colors.white,
              loop: 3,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .015,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .13,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .28,
                              height: MediaQuery.of(context).size.height * .12,
                              color: Colors.white,
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .023,
                                width: MediaQuery.of(context).size.width * .15,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * .4,
                          height: MediaQuery.of(context).size.height * .001,
                          color: Colors.white),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.height * .015,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.height * .015,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .012,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .2,
                                  height:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(
                                        context,
                                      ).size.height *
                                      .005,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .2,
                                  height:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: MediaQuery.of(context).size.height * .022,
                              width: MediaQuery.of(context).size.width * .13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .08,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .015,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .13,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .28,
                              height: MediaQuery.of(context).size.height * .12,
                              color: Colors.white,
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .023,
                                width: MediaQuery.of(context).size.width * .15,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * .4,
                          height: MediaQuery.of(context).size.height * .001,
                          color: Colors.white),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.height * .015,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.height * .015,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .012,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .2,
                                  height:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(
                                        context,
                                      ).size.height *
                                      .005,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .2,
                                  height:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: MediaQuery.of(context).size.height * .022,
                              width: MediaQuery.of(context).size.width * .13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildList(List<Product> items) {
    return Container(
      width: MediaQuery.of(context).size.width * .93,
      height: MediaQuery.of(context).size.height * .27,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext ctx, index) {
          var data = items[index];
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .015,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .13,
                  width: MediaQuery.of(context).size.width * .4,
                  child: Stack(
                    children: [
                      Container(
                        child: Image.network(
                          "${data.images![0].src}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Positioned(
                      //   left: 0,
                      //   top: 0,
                      //   child: Container(
                      //     height: MediaQuery.of(context).size.height * .023,
                      //     width: MediaQuery.of(context).size.width * .15,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       border: Border.all(
                      //         color: const Color(
                      //           0xff414042,
                      //         ),
                      //       ),
                      //     ),
                      //     child: Center(
                      //       child: TextWidget(
                      //         text: '${snapshot.data![index].weight}gm x1',
                      //         fontSize: 10.5,
                      //         color: Color(
                      //           0xff414042,
                      //         ),
                      //         textAlign: TextAlign.center,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Positioned(
                      //   right: 0,
                      //   top: 0,
                      //   child: IconButtonWidget(
                      //     icon: Icons.favorite_border,
                      //     iconSize: 25,
                      //     color: const Color(
                      //       0xffed1651,
                      //     ),
                      //   ),
                      // ),
                      // Positioned(
                      //   bottom: 0,
                      //   right: 0,
                      //   child: IconButtonWidget(
                      //     onTap: () {
                      //       // addItem(
                      //       //   snapshot.data![index].id!,
                      //       //   snapshot.data![index].price!,
                      //       //   snapshot.data![index].name!,
                      //       //   snapshot
                      //       //       .data![index].image!.src!,
                      //       // );
                      //       Scaffold.of(context).hideCurrentSnackBar();
                      //       Scaffold.of(context).showSnackBar(SnackBar(
                      //         content: Text('Added item to cart!'),
                      //         duration: Duration(seconds: 2),
                      //         action: SnackBarAction(
                      //             textColor: const Color(
                      //               0xffed1651,
                      //             ),
                      //             label: 'UNDO',
                      //             onPressed: () {
                      //               removeSingleItem(
                      //                 snapshot.data![index].id!,
                      //               );
                      //             }),
                      //       ));
                      //       // cartController.addItem(
                      //       //   homeController
                      //       //       .trendingProductList[index]
                      //       //       .id!,
                      //       //   homeController
                      //       //       .trendingProductList[index]
                      //       //       .salePrice!,
                      //       //   homeController
                      //       //       .trendingProductList[index]
                      //       //       .name!,
                      //       //   homeController
                      //       //       .trendingProductList[index]
                      //       //       .images![0]
                      //       //       .src!,
                      //       // );
                      //     },
                      //     icon: Icons.add_circle,
                      //     iconSize: 40,
                      //     color: Color(
                      //       0xff292665,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .4,
                  height: MediaQuery.of(context).size.height * .001,
                  color: const Color(
                    0xff414042,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                GestureDetector(
                  onTap: () async {
                    // SharedPreferences preferences =
                    //     await SharedPreferences.getInstance();
                    // await preferences.setInt(
                    //     'proId', snapshot.data![index].id!);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ProductDetailScreen(
                    //               product: snapshot.data![index],
                    //             )));
                    // Get.toNamed("/ProductDetail",
                    //     arguments: homeController
                    //         .trendingProductList[index].id);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .38,
                        child: TextWidget(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: '${data.name}',
                          fontSize: 13.35,
                          fontWeight: FontWeight.bold,
                          color: const Color(
                            0xff414042,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .012,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .38,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'PKR ${data.regularPrice}',
                                  color: Color(
                                    0xff414042,
                                  ),
                                  fontSize: 9.5,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(
                                        context,
                                      ).size.height *
                                      .002,
                                ),
                                TextWidget(
                                  text: 'PKR ${data.salePrice}',
                                  fontSize: 14,
                                  color: const Color(
                                    0xff292665,
                                  ),
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const Spacer(),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: const Color(
                            //         0xffed1651,
                            //       ),
                            //     ),
                            //     borderRadius: BorderRadius.circular(
                            //       50,
                            //     ),
                            //   ),
                            //   width: MediaQuery.of(context).size.width * .09,
                            //   height: MediaQuery.of(context).size.height * .023,
                            //   child: Center(
                            //     child: TextWidget(
                            //       text: '-   %',
                            //       fontSize: 12,
                            //       fontWeight: FontWeight.bold,
                            //       color: Color(
                            //         0xffed1651,
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
