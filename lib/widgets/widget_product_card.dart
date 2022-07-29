import 'package:flutter/material.dart';
import 'package:khoj_tech/models/product.dart';
import 'package:khoj_tech/widgets/text_widget.dart';

class ProductCard extends StatelessWidget {
  ProductCard({Key? key, this.data}) : super(key: key);

  Product? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    data!.images!.length > 0
                        ? data!.images![0].src!
                        : 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png',
                    // "${data!.images![0].src}",
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
                //     icon: snapshot.data![index].featured == true
                //         ? Icons.favorite
                //         : Icons.favorite_border,
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
            onTap: () async {},
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .38,
                  child: TextWidget(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    text: '${data!.name}',
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
                          Visibility(
                            visible: data!.salePrice != data!.regularPrice,
                            child: TextWidget(
                              text: 'PKR ${data!.regularPrice}',
                              color: const Color(
                                0xff414042,
                              ),
                              fontSize: 9.5,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(
                                  context,
                                ).size.height *
                                .002,
                          ),
                          TextWidget(
                            text: 'PKR ${data!.salePrice}',
                            fontSize: 14,
                            color: const Color(
                              0xff292665,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Visibility(
                        visible: data!.calculateDiscount() > 0 ,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(
                                0xffed1651,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          width: MediaQuery.of(context).size.width * .09,
                          height: MediaQuery.of(context).size.height * .023,
                          child: Center(
                            child: TextWidget(
                              text: '- ${data!.calculateDiscount()} %',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color(
                                0xffed1651,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
