import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/style/colors.dart' as Style;
import 'package:movies_app/data/api_constants/constants.dart';
import 'package:movies_app/domain/movies_provider.dart';
import 'package:movies_app/data/models/movies_model.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';

Widget buildSectionCategory(context) {
  List<MoviesModel> myList = Provider.of<Movies>(context).listDataModel;
  return SizedBox(
    height: MediaQuery.of(context).size.height / 2.5,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Now Playing',
              style: TextStyle(
                  color: Style.ThemeColors.secondColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.arrowRight,
                  color: Colors.white,
                )),
          ],
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: myList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    /// Image
                    Container(
                      width: 120.0,
                      height: 180.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              ApiConstant.baseImageUrl +
                                  myList[index].posterPath,
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),

                    /// Space
                    const SizedBox(
                      height: 7.0,
                    ),

                    /// Movie Text
                    SizedBox(
                      width: 100.0,
                      child: Text(
                        myList[index].title,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget movieSlider(context) {
  List<MoviesModel> myList = Provider.of<Movies>(context).listDataModel;

  final PageController pageController =
      PageController(keepPage: true, viewportFraction: 1);

  return SizedBox(
    height: MediaQuery.of(context).size.height / 4,
    child: PageIndicatorContainer(
      align: IndicatorAlign.bottom,
      indicatorSpace: 8.0,
      padding: const EdgeInsets.all(5.0),
      indicatorColor: Style.ThemeColors.titleColor,
      indicatorSelectorColor: Style.ThemeColors.secondColor,
      shape: IndicatorShape.circle(size: 7.0),
      length: myList.take(5).length,
      child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemCount: myList.take(5).length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Stack(
              children: [
                Hero(
                  tag: myList[index].id,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          ApiConstant.baseImageUrl + myList[index].backdropPath,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.bottomCenter * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    myList[index].title,
                    style: const TextStyle(
                      fontSize: 25.0,
                      decorationThickness: 10.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
