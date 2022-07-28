import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:khoj_tech/api_service.dart';
import 'package:khoj_tech/config.dart';
import 'package:khoj_tech/models/slider_model.dart';
import 'package:khoj_tech/widgets/widget_home_categories.dart';
import 'package:khoj_tech/widgets/widget_home_products.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;
  final CarouselController controller = CarouselController();
  APIService? apiService;

  @override
  void initState() {
    apiService = APIService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(
          0xfff2f2f2,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            _imageCarousel(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            WidgetCategories(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            WidgetHomeProducts(
              labelName: "Trending Products",
              tagId: Config.trendingProductsTagId,
            )
          ],
        ),
      ),
    );
  }

  FutureBuilder<dynamic> _imageCarousel() {
    return FutureBuilder<SliderModel>(
      future: apiService!.getSlider(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * .2,
              viewportFraction: 1,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              },
            ),
            items: snapshot.data!.acf!.image!
                .map(
                  (item) => Container(
                    width: MediaQuery.of(context).size.width * .95,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Image.network(
                            item.slide!,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * .95,
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(
                                      200,
                                      0,
                                      0,
                                      0,
                                    ),
                                    Color.fromARGB(
                                      0,
                                      0,
                                      0,
                                      0,
                                    )
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: snapshot.data!.acf!.image!
                                    .asMap()
                                    .entries
                                    .map(
                                  (entry) {
                                    return GestureDetector(
                                      onTap: () => controller.animateToPage(
                                        entry.key,
                                      ),
                                      child: Container(
                                        width: 8.0,
                                        height: 8.0,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                          horizontal: 4.0,
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              (Theme.of(context).brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.white)
                                                  .withOpacity(
                                            current == entry.key ? 0.9 : 0.4,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white,
            loop: 3,
            child: Container(
              width: MediaQuery.of(context).size.width * .95,
              height: MediaQuery.of(context).size.height * .2,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
