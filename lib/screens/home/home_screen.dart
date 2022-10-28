import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/custom_text_styles.dart';
import 'package:study_app/extensions/context_extension.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:study_app/providers/all_providers.dart';
import 'package:study_app/screens/home/menu_screen.dart';
import 'package:study_app/screens/home/question_card.dart';
import 'package:study_app/widgets/app_circle_button.dart';
import 'package:study_app/widgets/content_area.dart';

import '../../configs/themes/app_icons.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void didChangeDependencies() {
    ref.read(questionPaperControllerProvider.notifier).getAllPapers(ref);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<QuestionPaperModel> list =
        ref.watch(questionPaperControllerProvider).allPapers;

    return Scaffold(
        body: ZoomDrawer(
      menuScreenTapClose: true,
      menuScreenWidth: double.maxFinite,
      slideWidth: context.width * 0.65,
      showShadow: true,
      style: DrawerStyle.defaultStyle,
      angle: 0,
      borderRadius: 50,
      controller: ref.watch(zoomDrawerProvider).zoomDrawerController,
      menuScreen: const MyMenuScreen(),
      mainScreen: Container(
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppCircleButton(
                      onTap: ref.read(zoomDrawerProvider).toogleDrawer,
                      child: const Icon(
                        AppIcons.menuLeft,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const Icon(
                            AppIcons.peace,
                          ),
                          Text(
                            "Hello friend",
                            style:
                                detailText.copyWith(color: onSurfaceTextColor),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "What do you want to learn today?",
                      style: headerText,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ContentArea(
                    addPadding: false,
                    child: ListView.separated(
                        padding: context.p25,
                        //shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return QuestionCard(
                            model: list[index],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemCount: list.length),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
