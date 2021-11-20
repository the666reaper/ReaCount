import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reacount_2/View/Themes/theme_controller.dart';
import 'package:reacount_2/View/widgets/home_add_edit.dart';
import 'package:reacount_2/View/widgets/home_app_bar.dart';
import 'package:reacount_2/View/widgets/home_view.dart';

class HomePage extends GetView {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      initState: (_) {},
      builder: (themeController) {
        return Scaffold(
          backgroundColor: themeController.theme.backgroundColor,
          appBar: AppBars.HomeAppBar,
          body: const HomeView(),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              const HomePageAddOrEdit(isEditing: false);
            },
          ),
        );
      },
    );
  }
}
