import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:khoj_tech/models/product.dart';
import 'package:khoj_tech/utils/custom.stepper.dart';

class ProductDetailsWidget extends StatelessWidget {
  ProductDetailsWidget({Key? key, this.data}) : super(key: key);
  Product? data;
  final CarouselController _controller = CarouselController();
  int? qty = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                productImages(data!.images!, context),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                    visible: data!.calculateDiscount() > 0,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.pink),
                        child: Text(
                          '${data!.calculateDiscount()}% OFF',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  data!.name!,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data!.attributes != null && data!.attributes!.length > 0
                          ? (data!.attributes![0].options!.join("-").toString() +
                              "" +
                              data!.attributes![0].name!)
                          : "",
                    ),
                    Text('PKR ${data!.salePrice}', style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomStepper(
                      lowerLimit: 0,
                      upperLimit: 20,
                      stepValue: 1,
                      iconSize: 22,
                      value: this.qty,
                      onChanged: (value){
                        print(value);
                      },
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget productImages(List<Img1> images, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: ((context, index, realIndex) {
                return Container(
                  child: Center(
                    child: Image.network(
                      images[index].src!,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }),
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  aspectRatio: 1.0),
              carouselController: _controller,
            ),
          ),
          Positioned(
            top: 100,
            child: IconButton(
              onPressed: () {
                _controller.previousPage();
              },
              icon: Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width - 80,
            child: IconButton(
              onPressed: () {
                _controller.nextPage();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
