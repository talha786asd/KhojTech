import 'package:flutter/material.dart';
import 'package:khoj_tech/models/product.dart';
import 'package:khoj_tech/pages/base_page.dart';
import 'package:khoj_tech/widgets/widget_product_details.dart';

class ProductDetails extends BasePage {
  ProductDetails({Key? key, this.product}) : super(key: key);
  Product? product;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends BasePageState<ProductDetails> {
  @override
  Widget pageUI() {
    return ProductDetailsWidget(
      data: this.widget.product,
    );
  }
}
