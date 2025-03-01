import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/core/presentation/select_category/pages/select_category_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lost_and_found/utils/colors/custom_color.dart';


class CategorySelectionForm extends StatelessWidget {
  final ValueChanged<Pair<int, String>> onTap;
  final String category;
  final bool showError;
  final String errorText;
  final bool removeAllOption;

  const CategorySelectionForm(
      {super.key,
      required this.onTap,
      required this.category,
      required this.showError,
      required this.errorText,
      this.removeAllOption = false});

  Future<void> navigateToCategorySelection(BuildContext context) async {
    final category = await Navigator.push<Pair<int, String>>(
      context,
      MaterialPageRoute(builder: (context) => CategorySelectionScreen(removeAllOption: removeAllOption)),
    );

    if (category != null) {
      onTap(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 0,
        ),
        Material(
          color: Theme.of(context).extension<CustomColors>()!.background2,
          child: InkWell(
            onTap: () async =>
                {FocusManager.instance.primaryFocus?.unfocus(), await navigateToCategorySelection(context)},
            borderRadius: BorderRadius.circular(0),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 0, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.categoryFormEntryTitle,
                                style: const TextStyle(fontSize: 22),
                              ),
                            ],
                          ),
                          showError && category == ""
                              ? const SizedBox(
                                  height: 8,
                                )
                              : Container(),
                          showError && category == ""
                              ? Text(
                                  errorText,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        if (category.isNotEmpty)
                          Text(
                            category,
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        const Icon(
                          Icons.chevron_right,
                          size: 50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
