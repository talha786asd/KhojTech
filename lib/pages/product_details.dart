import 'package:flutter/material.dart';
import 'package:khoj_tech/api_service.dart';
import 'package:khoj_tech/models/product.dart';
import 'package:khoj_tech/models/variable_product.dart';
import 'package:khoj_tech/pages/base_page.dart';
import 'package:khoj_tech/widgets/widget_product_details.dart';

class ProductDetails extends BasePage {
  ProductDetails({Key? key, this.product}) : super(key: key);
  Product? product;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends BasePageState<ProductDetails> {
  APIService? apiService;

  @override
  void initState() {
    apiService = APIService();
    super.initState();
  }

  @override
  Widget pageUI() {
    return this.widget.product!.type == "variable"
        ? _variableProductList()
        : ProductDetailsWidget(
            data: this.widget.product,
          );
  }

  Widget _variableProductList() {
    apiService = APIService();
    return FutureBuilder(
        future: apiService!.getVariableProducts(this.widget.product!.id!),
        builder:
            (BuildContext context, AsyncSnapshot<List<VariableProduct>> model) {
          if (model.hasData) {
            return ProductDetailsWidget(
              data: this.widget.product,
              variableProducts: model.data,
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Color(
                0xff292665,
              ),
            ),
          );
        });
  }
}
