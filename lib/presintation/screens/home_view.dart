import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:movies_app/presintation/widgets/reusable_widgets.dart';
import 'package:movies_app/common/style/colors.dart' as Style;

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("buildddd=====>build");
    return Scaffold(
      backgroundColor: Style.ThemeColors.mainColor,
      appBar: AppBar(
        backgroundColor: const Color(0xff1A1A2E),
        title: const Text('Movies App'),
        centerTitle: true,
        actions: [IconButton(
          onPressed: () {},
          icon:  const Icon(EvaIcons.searchOutline),
        ),
        ],
        leading: const Icon(EvaIcons.menu2Outline, color: Colors.white,),
      ),
      body: Column(
            children: [
              /// Slider
              movieSlider(context),
              /// SectionBar
              buildSectionCategory(context),
            ],
          ),
    );
  }
}
