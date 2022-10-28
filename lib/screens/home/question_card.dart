import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/configs/themes/app_icons.dart';
import 'package:study_app/configs/themes/custom_text_styles.dart';
import 'package:study_app/extensions/context_extension.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:study_app/providers/all_providers.dart';
import 'package:study_app/widgets/app_icon_text.dart';

class QuestionCard extends ConsumerWidget {
  final QuestionPaperModel model;
  const QuestionCard({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          ref
              .read(questionPaperControllerProvider)
              .navigateToQuestions(context: context, paper: model);
        },
        child: Padding(
          padding: context.paddingLow,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(
                      color: context.primaryColor.withOpacity(0.1),
                      child: SizedBox(
                        height: context.width * 0.15,
                        width: context.width * 0.15,
                        child: CachedNetworkImage(
                          imageUrl: model.imageUrl!,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Text(error),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: cartTitles(context),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: context.lowValue * 1.2),
                          child: Text(model.description),
                        ),
                        Row(
                          children: [
                            AppIconText(
                              icon: Icon(
                                Icons.help_outline_sharp,
                                color: context.isDarkMode
                                    ? Colors.white
                                    : context.primaryColor,
                              ),
                              text: Text(
                                '${model.questionCount} questions',
                                style: detailText.copyWith(
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : context.primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            AppIconText(
                              icon: Icon(
                                Icons.timer,
                                color: context.isDarkMode
                                    ? Colors.white
                                    : context.primaryColor,
                              ),
                              text: Text(
                                model.timeInMinits(),
                                style: detailText.copyWith(
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : context.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: -10,
                right: -10,
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      color: context.primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: const Icon(AppIcons.trophyOutline),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
