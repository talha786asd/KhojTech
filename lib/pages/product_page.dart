import 'dart:async';

import 'package:flutter/material.dart';
import 'package:khoj_tech/models/product.dart';
import 'package:khoj_tech/pages/base_page.dart';
import 'package:khoj_tech/provider/products_provider.dart';
import 'package:khoj_tech/widgets/widget_product_card.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProductPage extends BasePage {
  ProductPage({Key? key, this.categoryId}) : super(key: key);
  int? categoryId;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends BasePageState<ProductPage> {
  int _page = 1;
  ScrollController _scrollController = ScrollController();
  final _searchQuery = TextEditingController();
  Timer? _debounce;
  final _sortByOptions = {
    SortBy('popularity', 'Popularity', 'asc'),
    SortBy('modified', 'Latest', 'asc'),
    SortBy('price', 'Price: High to Low', 'desc'),
    SortBy('price', 'Price: Low to High', 'asc'),
  };

 @override
  void initState() {
   
    var productList = Provider.of<ProductProvider>(
      context,
      listen: false,
    );
      Future.delayed(Duration.zero,(){
            productList.resetStreams();
    productList.setLoadingState(
      LoadMoreStatus.INITIAL,
    );
    productList.fetchProducts(
      _page,
    );
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        productList.setLoadingState(
          LoadMoreStatus.LOADING,
        );
        productList.fetchProducts(
          ++_page,
        );
      }
    });
    _searchQuery.addListener(() {
      _onSearchChange();
    });
      
  });

    super.initState();
  }

  _onSearchChange() {
    var productList = Provider.of<ProductProvider>(context, listen: false);
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      productList.resetStreams();
      productList.setLoadingState(LoadMoreStatus.INITIAL);
      productList.fetchProducts(_page, strSearch: _searchQuery.text);
    });
  }

  @override
  Widget pageUI() {
    return _productsList();
  }

  Widget _productsList() {
    return Consumer<ProductProvider>(builder: (
      context,
      productsModel,
      child,
    ) {
      if (productsModel.allProducts != null &&
          productsModel.allProducts.length > 0 &&
          productsModel.getLoadMoreStatus() != LoadMoreStatus.INITIAL) {
        return _buildList(productsModel.allProducts,
            productsModel.getLoadMoreStatus() == LoadMoreStatus.LOADING);
      }
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .930,
          height: MediaQuery.of(context).size.height * .85,
          child: Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white,
            loop: 3,
            child: Column(
              children: [
                Row(
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
                                height:
                                    MediaQuery.of(context).size.height * .12,
                                color: Colors.white,
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .023,
                                  width:
                                      MediaQuery.of(context).size.width * .15,
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
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: MediaQuery.of(context).size.height *
                                        .015,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(
                                          context,
                                        ).size.height *
                                        .005,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: MediaQuery.of(context).size.height *
                                        .015,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .022,
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
                                height:
                                    MediaQuery.of(context).size.height * .12,
                                color: Colors.white,
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .023,
                                  width:
                                      MediaQuery.of(context).size.width * .15,
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
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: MediaQuery.of(context).size.height *
                                        .015,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(
                                          context,
                                        ).size.height *
                                        .005,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: MediaQuery.of(context).size.height *
                                        .015,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .022,
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
                Row(
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
                                height:
                                    MediaQuery.of(context).size.height * .12,
                                color: Colors.white,
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .023,
                                  width:
                                      MediaQuery.of(context).size.width * .15,
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
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: MediaQuery.of(context).size.height *
                                        .015,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(
                                          context,
                                        ).size.height *
                                        .005,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: MediaQuery.of(context).size.height *
                                        .015,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .022,
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
                                height:
                                    MediaQuery.of(context).size.height * .12,
                                color: Colors.white,
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .023,
                                  width:
                                      MediaQuery.of(context).size.width * .15,
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
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: MediaQuery.of(context).size.height *
                                        .015,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(
                                          context,
                                        ).size.height *
                                        .005,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: MediaQuery.of(context).size.height *
                                        .015,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .022,
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
                Row(
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
                                height:
                                    MediaQuery.of(context).size.height * .12,
                                color: Colors.white,
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .023,
                                  width:
                                      MediaQuery.of(context).size.width * .15,
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
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: MediaQuery.of(context).size.height *
                                        .015,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(
                                          context,
                                        ).size.height *
                                        .005,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: MediaQuery.of(context).size.height *
                                        .015,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .022,
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
                                height:
                                    MediaQuery.of(context).size.height * .12,
                                color: Colors.white,
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .023,
                                  width:
                                      MediaQuery.of(context).size.width * .15,
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
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: MediaQuery.of(context).size.height *
                                        .015,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(
                                          context,
                                        ).size.height *
                                        .005,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: MediaQuery.of(context).size.height *
                                        .015,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .022,
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
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildList(List<Product> items, bool isLoadMore) {
    return Column(
      children: [
        _productFilters(),
        SizedBox(
          height: MediaQuery.of(context).size.height * .015,
        ),
        Flexible(
            child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .930,
            height: MediaQuery.of(context).size.height * .85,
            child: GridView.builder(
                controller: _scrollController,
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 150 / 185),
                itemBuilder: (context, index) {
                  var data = items[index];
                  return ProductCard(
                    data: data,
                  );
                }),
          ),
        )),
        Visibility(
          child: Container(
            padding: EdgeInsets.all(5),
            height: 35,
            width: 35,
            child: CircularProgressIndicator(),
          ),
          visible: isLoadMore,
        )
      ],
    );
  }

  Widget _productFilters() {
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _searchQuery,
            cursorColor: const Color(
              0xff292665,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: "Search",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              fillColor: const Color(0xfff2f2f2),
              filled: true,
            ),
          )),
          const SizedBox(
            width: 15,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xfff2f2f2),
              borderRadius: BorderRadius.circular(9),
            ),
            child: PopupMenuButton(
              onSelected: (SortBy sortBy) {
                var productList =
                    Provider.of<ProductProvider>(context, listen: false);
                productList.resetStreams();
                productList.setSortOrder(sortBy);
                productList.fetchProducts(_page);
              },
              itemBuilder: (BuildContext context) {
                return _sortByOptions.map((item) {
                  return PopupMenuItem(
                    value: item,
                    child: Container(
                      child: Text(item.text!),
                    ),
                  );
                }).toList();
              },
              icon: const Icon(Icons.tune),
            ),
          )
        ],
      ),
    );
  }
}
