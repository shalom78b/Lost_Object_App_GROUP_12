import 'package:flutter/material.dart';

import 'package:lost_and_found/utils/colors/custom_color.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryItem({
    Key? key,
    required this.categoryName,
    required this.icon,
    required this.onTap,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const divider = Divider(
      height: 0,
    );

    return Column(
      children: [
        Material(
          color: Theme.of(context).colorScheme.background,
          child: InkWell(
            onTap: onTap,
            splashColor: Theme.of(context).extension<CustomColors>()!.splashGreyColor,
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          icon,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                categoryName,
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                description,
                                style: TextStyle(color: Theme.of(context).extension<CustomColors>()!.secondaryTextColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    size: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
        divider,
      ],
    );
  }
}
