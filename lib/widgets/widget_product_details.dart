import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:khoj_tech/models/product.dart';
import 'package:khoj_tech/models/variable_product.dart';
import 'package:khoj_tech/utils/custom.stepper.dart';
import 'package:khoj_tech/utils/expand_text.dart';
import 'package:khoj_tech/widgets/widget_related_products.dart';

class ProductDetailsWidget extends StatelessWidget {
  ProductDetailsWidget({Key? key, this.data, this.variableProducts}) : super(key: key);


  List<VariableProduct>? variableProducts;
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: data!.type != "variable",
                      child: Text(
                      data!.attributes != null && data!.attributes!.length > 0
                          ? (data!.attributes![0].options!
                                  .join("-")
                                  .toString() +
                              "" +
                              data!.attributes![0].name!)
                          : "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500
                          ),
                    ),),
                    Visibility(
                      visible: data!.type == "variable",
                      child: selectDropdown(
                        context, "",
                         this.variableProducts,
                          (VariableProduct value){
                            this.data!.price = value.price;
                            this.data!.variableProduct = value;

                         }
                        ),
                        ),
                    
                    Text(
                      'PKR ${data!.price}',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(
                                    0xff292665,
                                  ),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomStepper(
                      lowerLimit: 0,
                      upperLimit: 20,
                      stepValue: 1,
                      iconSize: 22,
                      value: this.qty,
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(
                                    0xff292665,
                                  ),
                      padding: EdgeInsets.all(15),
                      shape: StadiumBorder(),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                ExpandText(
                  labelHeader: "Product Details", shortDesc: data!.shortDescription,
                  desc: data!.description,
                ),
                Divider(),
                SizedBox(height: 10,),
                WidgetRelatedProducts(
                  labelName: 'Related Products',
                  products: this.data!.relatedIds,
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

  static Widget selectDropdown(
    BuildContext context,
    Object initialValue,
    dynamic data,
    Function onChanged, {
      Function? onValidate,
    }
  ){
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 75,
        width: 100,
        padding: EdgeInsets.only(top: 5),
        child: DropdownButtonFormField<VariableProduct>(
          hint: Text("Select"),
          value: null,
          isDense: true,
          decoration: fieldDecoration(context, "", ""),
          onChanged: (VariableProduct? newValue) {
            FocusScope.of(context).requestFocus(FocusNode());
            onChanged(newValue);
            
          },
         
          items: data != null ? data.map<DropdownMenuItem<VariableProduct>>(
            (VariableProduct data){
              return DropdownMenuItem<VariableProduct>(
                value: data,
                child: Text(
                  data.attributes!.first.option! + 
                  " " +
                  data.attributes!.first.name!,
                  style: TextStyle(
                    color: Colors.black
                  ),
                ));
            },
          ).toList()
          : null,

          
        ),
      ),
    );
  }

  static InputDecoration fieldDecoration(
    BuildContext context,
    String hintText,
    String helperText, {
      Widget? prefixIcon,
      Widget? suffixIcon,

    }

  ){
    return InputDecoration(
      contentPadding: EdgeInsets.all(6),
      hintText: helperText,
      helperText: helperText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(
                    0xff292665,
                  ),
          width: 1
        )
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(
                    0xff292665,
                  ),
          width: 1
        )
      )

    );

  }
}
