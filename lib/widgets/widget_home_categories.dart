import 'package:flutter/material.dart';
import 'package:khoj_tech/api_service.dart';
import 'package:khoj_tech/models/category.dart';
import 'package:khoj_tech/pages/product_page.dart';
import 'package:khoj_tech/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class WidgetCategories extends StatefulWidget {
  const WidgetCategories({Key? key}) : super(key: key);

  @override
  State<WidgetCategories> createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
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
                text: 'Categories',
                color: Color(
                  0xff414042,
                ),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              Spacer(),
              TextWidget(
                text: 'View All',
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
          height: MediaQuery.of(context).size.height * .025,
        ),
        _categoriesList()
      ],
    );
  }

  Widget _categoriesList() {
    return FutureBuilder(
        future: apiService!.getCategories(),
        builder: (BuildContext context, AsyncSnapshot<List<Category>> model) {
          if (model.hasData) {
            return _buildCategoryList(model.data!);
          }
          return Shimmer.fromColors(
            child: Container(
              width: MediaQuery.of(context).size.width * .9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .27,
                            height: MediaQuery.of(context).size.height * .08,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .018,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .27,
                            height: MediaQuery.of(context).size.height * .03,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .27,
                            height: MediaQuery.of(context).size.height * .08,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .018,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .27,
                            height: MediaQuery.of(context).size.height * .03,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .27,
                            height: MediaQuery.of(context).size.height * .08,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .018,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .27,
                            height: MediaQuery.of(context).size.height * .03,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .27,
                            height: MediaQuery.of(context).size.height * .08,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .018,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .27,
                            height: MediaQuery.of(context).size.height * .03,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .27,
                            height: MediaQuery.of(context).size.height * .08,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .018,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .27,
                            height: MediaQuery.of(context).size.height * .03,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .27,
                            height: MediaQuery.of(context).size.height * .08,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .018,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .27,
                            height: MediaQuery.of(context).size.height * .03,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .27,
                        height: MediaQuery.of(context).size.height * .08,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .018,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .27,
                        height: MediaQuery.of(context).size.height * .03,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            ),
            baseColor: Colors.black12,
            highlightColor: Colors.white,
            loop: 3,
          );
        });
  }

  Widget _buildCategoryList(List<Category> categories) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: categories.length,
        itemBuilder: (BuildContext ctx, index) {
          var data = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            categoryId: data.categoryId,
                          )));
            },
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    "${data.image!.url}",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * .07,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .018,
                  ),
                  TextWidget(
                    text: data.categoryName,
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    color: Color(
                      0xff414042,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
